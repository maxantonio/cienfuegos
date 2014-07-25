require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get unauthorized without valid credentials" do
    get :index
    assert_response 401
  end
end
