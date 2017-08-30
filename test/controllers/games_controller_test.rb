require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { date_played: @game.date_played, oponent_id: @game.oponent.id, 
        score_oponent: @game.score_oponent, user_score: @game.user_score }
    end

    assert_redirected_to rankings_url
  end

end
