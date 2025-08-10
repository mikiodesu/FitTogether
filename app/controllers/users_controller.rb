class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    
  if @user == current_user
    # 自分のページなら全投稿取得
    @workouts = @user.workouts.order(created_at: :desc)
  else
    # 他人のページなら公開投稿のみ取得
    @workouts = @user.workouts.where(is_public: true).order(created_at: :desc)
  end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました"
    else
      render :edit
    end
  end

  def mypage
    @user = current_user
  end

  def update_credentials
    @user = current_user
    # パスワードが空ならパスワード更新しないようにする
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(account_params)
      redirect_to mypage_users_path, notice: 'アカウント情報を更新しました'
    else
      render :mypage
    end
  end

  def destroy
    user = User.find(params[:id])
    if user == current_user
      user.destroy
      sign_out current_user
      redirect_to root_path, notice: "アカウントを削除しました。"
    else
      redirect_to root_path, alert: "権限がありません。"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def account_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
