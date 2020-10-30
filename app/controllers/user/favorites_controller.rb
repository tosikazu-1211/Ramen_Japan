class User::FavoritesController < ApplicationController

	before_action :authenticate_user!

	#いいねを付ける
	def create
		ramen_noodle = RamenNoodle.find(params[:ramen_noodle_id])
		favorite = current_user.favorites.new(ramen_noodle_id: ramen_noodle.id)
		favorite.save
		redirect_back(fallback_location: root_path)
	end

	#いいねの取り消し
	def destroy
		ramen_noodle = RamenNoodle.find(params[:ramen_noodle_id])
		favorite = current_user.favorites.find_by(ramen_noodle_id: ramen_noodle.id)
		favorite.destroy
		redirect_back(fallback_location: root_path)
	end

end
