class User::RamenNoodleCommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		ramen_noodle = RamenNoodle.find(params[:ramen_noodle_id])
		comment = current_user.ramen_noodle_comments.new(ramen_noodle_comment_params)
		comment.ramen_noodle_id = ramen_noodle.id
		comment.save
		redirect_to user_ramen_noodle_path(ramen_noodle)
	end

	def destroy
		RamenNoodleComment.find_by(id: params[:id], ramen_noodle_id: params[:ramen_noodle_id]).destroy
		redirect_to user_ramen_noodle_path(params[:ramen_noodle_id])
	end

	private

	def ramen_noodle_comment_params
		params.require(:ramen_noodle_comment).permit(:comment)
	end

end
