class User::HomesController < ApplicationController
  # トップページ
  def top
    @all_ranks = RamenNoodle.find(Favorite.group(:ramen_noodle_id).order('count(ramen_noodle_id) desc').limit(3).pluck(:ramen_noodle_id))
  end

  # aboutページ
  def about
  end
end
