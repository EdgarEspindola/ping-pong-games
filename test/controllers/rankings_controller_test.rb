require 'test_helper'

class RankingsControllerTest < ActionController::TestCase
  setup do
    @ranking = rankings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rankings)
  end
 
end
