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

  # ユーザー削除アクション
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :age, :email)
  end
end
