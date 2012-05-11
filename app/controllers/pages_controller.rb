class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  before_filter :load_site, :only => :show
  layout 'dashboard', :only => :edit
  # GET /pages
  # GET /pages.json
  def index
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @pages = @site.pages.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end

  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @user = current_user
    @site = Site.find_by_subdomain!(request.subdomain)

    if params[:id]
      @page = @site.pages.find(params[:id])
    else
      @page = @site.pages.find(:first, :order => 'position ASC')
    end

    @col = Col.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @new_page = Page.new
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @pages = @site.pages.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @sites = @user.sites.all
    @pages = @site.pages.all
    @site_resource = SiteResource.new
    @site_resources = @site.site_resources

    if params[:id]
      @page = @site.pages.find(params[:id])
    else
      @page = @site.pages.find(:first, :order => 'position ASC')
    end
    @row = @page.rows.build
    @col = @row.cols.build

    if params[:id]
      @page = @site.pages.find(params[:id])
    else
      @page = @site.pages.find(:first, :order => 'position ASC')
    end
    @new_page = @site.pages.build
    @new_site = @user.sites.build

  end

  # POST /pages
  # POST /pages.json
  def create
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)

    @page = @site.pages.build(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to edit_page_path(@page), notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @page = @site.pages.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)

    @page = Page.find(params[:id])
    @page.destroy

    @homepage = @site.pages.find(:first, :order => 'position ASC')
    @homepage.position = 1
    @homepage.save


    respond_to do |format|
      format.html { redirect_to edit_url }
      format.json { head :no_content }
    end
  end

  def sort
    params[:page].each_with_index do |id, index|
      Page.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
