class Admin::SessionsController < Devise::SessionsController
   # ログイン後・ログアウト後のリダイレクト先
   def after_sign_in_path_for(resource)
    admin_root_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
end
