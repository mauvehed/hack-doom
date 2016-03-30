require 'test_helper'

class ConsoleControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get console_show_url
    assert_response :success
  end

end
