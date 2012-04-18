class RegistrationsController < Devise::RegistrationsController
  def new
    Site.build
  end
end