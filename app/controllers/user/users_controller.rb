class User::UsersController < ApplicationController

	before_action :authenticate_user!

	#マイページ
	def show
		@user = current_user
	end

	#退会ページ
	def quit
	end

  #退会アクション
  def withdraw
  	@user = current_user
  	@user.update(is_deleted: true)
    reset_session #ログアウトさせる
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
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

  private

  def user_params
  	params.require(:user).permit(:name, :gender, :age, :email)
  end

end
