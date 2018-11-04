require 'test_helper'

class CupboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cupboard_index_url
    assert_response :success
  end

end
