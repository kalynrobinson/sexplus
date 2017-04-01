require 'test_helper'

class UserPairsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_pairs_new_url
    assert_response :success
  end

end
