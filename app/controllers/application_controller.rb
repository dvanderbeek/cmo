class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  def after_sign_in_path_for(resource_or_scope)
    sites_path
  end

  protected

  def load_site
    @current_site = Site.find_by_subdomain(request.subdomain)
    if @current_site.nil?
      flash[:error] = "Site invalid"
      redirect_to sites_url(subdomain: false)
    end
  end

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      (@current_site && @current_site.layout) || 'application'
    end
  end
end
