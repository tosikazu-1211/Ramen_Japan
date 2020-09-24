class User::UsersController < ApplicationController

	before_action :authenticate_user!

	#マイページ
	def show
		@user = current_user
    @ramen_noodles = @user.ramen_noodles
	end

  #登録情報編集ページ
  def edit
  	@user = current_user
  end

  #更新アクション
  def update
  	@user = current_user
  	if @user.update(user_params)
  		flash[:notice] = "登録情報を変更しました"
  		redirect_to user_user_path
  	else
  		render "edit"
  	end
  end

  #退会アクション
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "ユーザーを削除しました。"
    redirect_to :root
  end

  private

  def user_params
  	params.require(:user).permit(:name, :gender, :age, :email)
  end

end
