require "test_helper"

class MenuCatogariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_catogary = menu_catogaries(:one)
  end

  test "should get index" do
    get menu_catogaries_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_catogary_url
    assert_response :success
  end

  test "should create menu_catogary" do
    assert_difference("MenuCatogary.count") do
      post menu_catogaries_url, params: { menu_catogary: { menu_id: @menu_catogary.menu_id, name: @menu_catogary.name } }
    end

    assert_redirected_to menu_catogary_url(MenuCatogary.last)
  end

  test "should show menu_catogary" do
    get menu_catogary_url(@menu_catogary)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_catogary_url(@menu_catogary)
    assert_response :success
  end

  test "should update menu_catogary" do
    patch menu_catogary_url(@menu_catogary), params: { menu_catogary: { menu_id: @menu_catogary.menu_id, name: @menu_catogary.name } }
    assert_redirected_to menu_catogary_url(@menu_catogary)
  end

  test "should destroy menu_catogary" do
    assert_difference("MenuCatogary.count", -1) do
      delete menu_catogary_url(@menu_catogary)
    end

    assert_redirected_to menu_catogaries_url
  end
end
