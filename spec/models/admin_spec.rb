require 'rails_helper'

RSpec.describe Admin, type: :model do
  context "データが正しく保存される" do
    before do
      @admin = Admin.new
      @admin.name = "山田太郎"
      @admin.email = "test@test.com"
      @admin.password = "password"
      @admin.save
    end

    it "全て入力してあるので保存される" do
      expect(@admin).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before do
      @admin = Admin.new
      @admin.name = ""
      @admin.email = "test@test.com"
      @admin.password = "password"
      @admin.save
    end

    it "nameが入力されていないので保存されない" do
      expect(@admin).to be_invalid
      expect(@admin.errors[:name]).to include("が入力されていません。")
    end
  end
end
