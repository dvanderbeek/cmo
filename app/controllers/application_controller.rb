class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  def after_sign_in_path_for(resource_or_scope)
    sites_path
  end

  protected

  def load_site
     @site = Site.find_by_subdomain!(request.subdomain)
  end

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
