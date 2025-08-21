class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!  # 管理者でログイン必須

end