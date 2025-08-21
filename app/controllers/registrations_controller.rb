class RegistrationsController < Devise::RegistrationsController
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    workouts_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end