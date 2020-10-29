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

	context "データが正しく保存されない" do
		before do
			@user = User.new
			@user.name = ""
			@user.gender = "男"
			@user.age = "25"
			@user.email = "test@test.com"
			@user.password = "password"
			@user.save
		end
		it "nameが入力されていないので保存されない" do
			expect(@user).to be_invalid
			expect(@user.errors[:name]).to include("が入力されていません。")
		end
	end
end
