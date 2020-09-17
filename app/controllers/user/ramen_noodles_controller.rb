class User::RamenNoodlesController < ApplicationController

	def create
		@ramen_noodle = RamenNoodle.new(ramen_noodle_params)
		@ramen_noodle.user_id = current_user.id
		if @ramen_noodle.save
			redirect_to ramen_noodle_path(@ramen_noodle), notice: "You have created ramen_noodle successfully."
		else
			@ramen_noodle.user_id = current_user.id
			@ramen_noodles = RamenNoodle.all
			render 'index'
	end

	def index
		@ramen_noodles = RamenNoodle.all
		@ramen_noodle = RamenNoodle.new
	end

	def show
		@ramen_noodle = RamenNoodle.new
		@ramen_noodle1 = RamenNoodle.find(:id)
		@user = @ramen_noodle1.user
		@ramen_noodle_comment = RamenComment.new
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def ramen_noodle_params
		params.require(:ramen_noodle).permit(:title, :address, :name, :price, :body)
	end

end
