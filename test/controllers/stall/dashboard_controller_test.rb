require "test_helper"

class Stall::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stall_dashboard_index_url
    assert_response :success
  end
end
