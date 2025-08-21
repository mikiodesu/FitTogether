class Admin::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_up_path_for(resource)
    admin_root_path
  end

  def after_sign_in_path_for(resource)
    admin_root_path
  end

 
end
