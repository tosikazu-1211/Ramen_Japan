class User::RamenNoodlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ramen_noodle, only: [:show, :edit, :update, :destroy]

  # レビュー新規投稿ページ
  def new
    @ramen_noodle = RamenNoodle.new
  end

  # レビュー投稿アクション
  def create
    @ramen_noodle = RamenNoodle.new(ramen_noodle_params)
    @ramen_noodle.user_id = current_user.id
    if @ramen_noodle.save(ramen_noodle_params)
      redirect_to user_ramen_noodle_path(@ramen_noodle.id), notice: "レビューを投稿しました！"
    else
      @ramen_noodles = RamenNoodle.all
      render 'new'
    end
  end

  # レビュー一覧ページ
  def index
    @ramen_noodles = RamenNoodle.page(params[:page]).reverse_order
  end

  # レビュー詳細ページ
  def show
    @ramen_noodle_comment = RamenNoodleComment.new
  end

  # レビュー更新ページ
  def edit
    @user = @ramen_noodle.user
  end

  # レビュー更新アクション
  def update
    if @ramen_noodle.update(ramen_noodle_params)
      redirect_to user_ramen_noodle_path(@ramen_noodle), notice: "レビュー内容を更新しました！"
    else
      render "edit"
    end
  end

  # レビュー削除アクション
  def destroy
    @ramen_noodle.destroy
    redirect_to user_ramen_noodles_path
  end

  # レビュー検索ページ
  def search
    if params[:address].present?
      @ramen_noodles = RamenNoodle.where('address LIKE ?', "%#{params[:address]}%")
    else
      @ramen_noodles = RamenNoodle.none
    end
  end

  private

  def ramen_noodle_params
    params.require(:ramen_noodle).permit(:title, :address, :image, :name, :price, :body)
  end

  def set_ramen_noodle
    @ramen_noodle = RamenNoodle.find(params[:id])
  end
end
