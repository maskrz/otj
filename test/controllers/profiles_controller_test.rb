require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get athlete_page" do
    get :athlete_page
    assert_response :success
  end

end
