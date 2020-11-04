class Admin::RamenNoodlesController < ApplicationController
	#レビュー一覧ページ
	def index
		@ramen_noodles = RamenNoodle.page(params[:page]).reverse_order
	end

	def show
		@ramen_noodle = RamenNoodle.find(params[:id])
	end
end
