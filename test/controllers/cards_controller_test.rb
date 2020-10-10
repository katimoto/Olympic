require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cards_new_url
    assert_response :success
  end

end
