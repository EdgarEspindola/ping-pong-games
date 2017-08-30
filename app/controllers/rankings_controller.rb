class RankingsController < ApplicationController
  
  # GET /rankings
  def index
    @rankings = Ranking.order('score DESC')
  end
  
end
