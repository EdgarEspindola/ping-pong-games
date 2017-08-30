class GamesController < ApplicationController
  
  # GET /games/new
  def new
    @game = Game.new
    @oponents = User.oponents(current_user)
  end

  # POST /games
  def create    
    Game.transaction do
      @game = Game.new(game_params)
      @game.user_id = current_user.id

      Ranking.update_for_the_game(@game) if @game.valid?  

      if @game.save
        redirect_to rankings_url, notice: "Game successful created."
      else
        @oponents = User.oponents(current_user)
        render :new
      end      
    end
  end

  def history
    user = current_user
    @games = user.games
  end

  private

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:date_played, :oponent_id, :score_oponent, :user_score)
    end
end
