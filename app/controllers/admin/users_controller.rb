class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  # ユーザー一覧ページ
  def index
    @users = User.page(params[:page]).per(10)
  end

  # ユーザー詳細ページ
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :age, :email)
  end
end
