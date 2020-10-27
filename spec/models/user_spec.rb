require 'rails_helper'

RSpec.describe User, type: :model do
	context "データが正しく保存される" do
		before do
			@user = User.new
			@user.name = "山田太郎"
			@user.gender = "男"
			@user.age = "25"
			@user.email = "test@test.com"
			@user.password = "password"
			@user.save
		end
		it "全て入力してあるので保存される" do
			expect(@user).to be_valid
		end
	end
end