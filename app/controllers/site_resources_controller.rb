class SiteResourcesController < ApplicationController
  # GET /site_resources
  # GET /site_resources.json
  def index
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @site_resource = SiteResource.new
    @site_resources = @site.site_resources

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_resources }
    end
  end

  # GET /site_resources/1
  # GET /site_resources/1.json
  def show
    @site_resource = SiteResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_resource }
    end
  end

  # GET /site_resources/new
  # GET /site_resources/new.json
  def new
    @site_resource = SiteResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_resource }
    end
  end

  # GET /site_resources/1/edit
  def edit
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @site_resource = @site.site_resources.find(params[:id])
  end

  # POST /site_resources
  # POST /site_resources.json
  def create
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)

    if @site.site_resources.maximum('position').nil?
      params[:site_resource][:position] = 1
    else
      params[:site_resource][:position] = @site.site_resources.maximum('position') + 1
    end

    @site_resource = @site.site_resources.build(params[:site_resource])

    respond_to do |format|
      if @site_resource.save
        format.html { redirect_to :back, notice: 'Site resource was successfully created.' }
        # format.json { render json: session[:return_to], status: :created, location: @site_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @site_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_resources/1
  # PUT /site_resources/1.json
  def update
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @site_resource = @site.site_resources.find(params[:id])

    respond_to do |format|
      if @site_resource.update_attributes(params[:site_resource])
        format.html { redirect_to :back, notice: 'Site resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_resources/1
  # DELETE /site_resources/1.json
  def destroy
    @user = current_user
    @site = @user.sites.find_by_subdomain!(request.subdomain)
    @site_resource = @site.site_resources.find(params[:id])
    @site_resource.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  def sort
    params[:site_resource].each_with_index do |id, index|
      SiteResource.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
