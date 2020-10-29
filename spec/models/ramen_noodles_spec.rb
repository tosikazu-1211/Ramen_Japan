require 'rails_helper'

RSpec.describe RamenNoodle, type: :model do
	context "データが正しく保存される" do
		before do
			@ramen_noodle = RamenNoodle.new
			@ramen_noodle.user = FactoryBot.build(:user)
			@ramen_noodle.title = "らーめん店"
			@ramen_noodle.address = "茨城県"
			@ramen_noodle.image = open("./app/assets/images/ramen1.png")
			@ramen_noodle.name = "しょうゆらーめん"
			@ramen_noodle.price = "800"
			@ramen_noodle.body = "美味しいです。"
			@ramen_noodle.save
		end
		it "全て入力してあるので保存される" do
			expect(@ramen_noodle).to be_valid
		end
	end

	context "データが正しく保存されない" do
		before do
			@ramen_noodle = RamenNoodle.new
			@ramen_noodle.user = FactoryBot.build(:user)
			@ramen_noodle.title = ""
			@ramen_noodle.address = "茨城県"
			@ramen_noodle.image = open("./app/assets/images/ramen1.png")
			@ramen_noodle.name = "しょうゆらーめん"
			@ramen_noodle.price = "800"
			@ramen_noodle.body = "美味しいです。"
			@ramen_noodle.save
		end
		it "titleが入力されていないので保存されない" do
      expect(@ramen_noodle).to be_invalid
      expect(@ramen_noodle.errors[:title]).to include("が入力されていません。")
    end
  end
end
