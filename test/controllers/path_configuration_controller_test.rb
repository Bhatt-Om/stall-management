require "test_helper"

class PathConfigurationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get path_configuration_index_url
    assert_response :success
  end
end
