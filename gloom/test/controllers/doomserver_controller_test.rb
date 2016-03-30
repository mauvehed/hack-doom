require 'test_helper'

class DoomserverControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doomserver_index_url
    assert_response :success
  end

end
