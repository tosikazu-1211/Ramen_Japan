class Admin::RamenNoodlesController < ApplicationController
  before_action :authenticate_admin!

  # レビュー一覧ページ
  def index
    @ramen_noodles = RamenNoodle.page(params[:page]).reverse_order
  end

  # レビュー詳細ページ
  def show
    @ramen_noodle = RamenNoodle.find(params[:id])
  end

  # レビュー削除アクション
  def destroy
    @ramen_noodle = RamenNoodle.find(params[:id])
    @ramen_noodle.destroy
    redirect_to admin_ramen_noodles_path
  end
end
