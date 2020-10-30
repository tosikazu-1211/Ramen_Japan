require 'rails_helper'

RSpec.describe "Ramen_noodles", type: :request do
  describe '新規レビュー投稿ページ' do
    context "新規レビュー投稿ページが正しく表示される" do
      before do
        get new_user_ramen_noodle_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("レビュー投稿はこちら")
      end
    end
  end
end
