class ApplicationController < ActionController::Base
  protect_from_forgery
  #layout :layout_by_resource

  def after_sign_in_path_for(resource_or_scope)
    sites_path
  end

  protected

  def load_site
    @current_site = Site.find_by_subdomain(request.subdomain)
    if @current_site.nil?
      flash[:error] = "Site invalid"
      redirect_to sites_url(subdomain: false)
    else
      self.class.layout(:layout_by_resource)
    end
  end

  def layout_by_resource
    if devise_controller?
      "devise"
    elsif action_name == "edit"
      "dashboard"
    else
      (@current_site && @current_site.layout.name) || 'application'
    end
  end
end
