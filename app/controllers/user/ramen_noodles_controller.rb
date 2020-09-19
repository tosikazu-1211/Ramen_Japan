class User::RamenNoodlesController < ApplicationController
	before_action :authenticate_user!

#レビュー新規投稿ページ
def new
	@ramen_noodle = RamenNoodle.new
end

#レビュー投稿アクション
def create
	@ramen_noodle = RamenNoodle.new(ramen_noodle_params)
	@ramen_noodle.user_id = current_user.id
	if @ramen_noodle.save(ramen_noodle_params)
		redirect_to user_ramen_noodle_path(@ramen_noodle.id), notice: "You have created ramen_noodle successfully."
	else
		@ramen_noodles = RamenNoodle.all
		render 'index'
	end
end

#レビュー一覧ページ
def index
	@ramen_noodles = RamenNoodle.all
	@ramen_noodle = RamenNoodle.new
end

#レビュー詳細ページ
def show
	@ramen_noodle = RamenNoodle.new
	@ramen_noodle1 = RamenNoodle.find(params[:id])
	#@ramen_noodle_comment = RamenComment.new
end

#レビュー更新ページ
def edit
	@ramen_noodle = RamenNoodle.find(params[:id])
	@user = @ramen_noodle.user
	if @user != current_user
		redirect_to ramen_noodles_path
	end
end

#レビュー更新アクション
def update
	@ramen_noodle = RamenNoodle.find(params[:id])
	if @ramen_noodle.update(ramen_noodle_params)
		redirect_to ramen_noodle_path(@ramen_noodle), notice: "You have updated ramen_noodle successfully."
	else
		render "edit"
	end
end

#レビュー削除アクション
def destroy
	@ramen_noodle = RamenNoodle.find(params[:id])
	@ramen_noodle.destroy
	redirect_to ramen_noodles_path
end

private

def ramen_noodle_params
	params.require(:ramen_noodle).permit(:title, :address, :image, :name, :price, :body)
end

end
