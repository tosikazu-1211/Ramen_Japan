require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'トップページ' do
    context "トップページが正しく表示される" do
      before do
        get root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("RamenJapan")
      end
    end
  end

  describe 'aboutページ' do
    context "aboutページが正しく表示される" do
      before do
        get about_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("RamenJapan")
      end
    end
  end
end