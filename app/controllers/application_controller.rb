class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: -> { self.class.name.start_with?("Admin::") },  except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    workouts_path
  end

  # サインアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    root_path  
  end

  # サインアップ後のリダイレクト先
  def after_sign_up_path_for(resource)
    workouts_path 
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end