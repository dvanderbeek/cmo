class SitesController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  before_filter :load_site, :only => :show
  layout 'dashboard', :only => :edit

  # GET /sites
  # GET /sites.json
  def index
    @user = current_user
    @sites = current_user.sites

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.find_by_subdomain!(request.subdomain)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @user = current_user
    @site = @user.sites.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @pages = @site.pages.all
    @new_page = @site.pages.build
    @sites = current_user.sites

    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "You don't have a site with that subdomain!"
      redirect_to sites_url(subdomain: false)
  end

  def edit_layout
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @page = @site.pages.find(:first)
    @layout = @site.layout
    render :layout => 'codemirror'

    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "You don't have a site with that subdomain!"
      redirect_to sites_url(subdomain: false)
  end

  def update_layout
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @layout = @site.layout

    respond_to do |format|
      if @layout.update_attributes(params[:layout])
        format.html { redirect_to edit_url(subdomain: @site.subdomain), notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /sites
  # POST /sites.json
  def create
    @user = current_user
    @site = @user.sites.build(params[:site])
    params[:site][:subdomain] = params[:site][:subdomain].parameterize

    respond_to do |format|
      if @site.save
        format.html { redirect_to root_url(subdomain: @site.subdomain), notice: 'Site was successfully created.' }
        format.json { render json: root_url(subdomain: @site.subdomain), status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @user = current_user
    @site = @user.sites.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to root_url(subdomain: @site.subdomain), notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @user = current_user
    @site = @user.sites.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  def robots
    @site = Site.find_by_subdomain!(request.subdomain)
    render 'sites/robots.txt.erb'
  end
end
