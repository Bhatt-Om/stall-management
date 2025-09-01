require "test_helper"

class ShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop = shops(:one)
  end

  test "should get index" do
    get shops_url
    assert_response :success
  end

  test "should get new" do
    get new_shop_url
    assert_response :success
  end

  test "should create shop" do
    assert_difference("Shop.count") do
      post shops_url, params: { shop: { building_id: @shop.building_id, stall_addres: @shop.stall_addres, stall_city: @shop.stall_city, stall_details: @shop.stall_details, stall_link: @shop.stall_link, stall_name: @shop.stall_name, stall_pincode: @shop.stall_pincode, stall_registraton_status: @shop.stall_registraton_status, stall_state: @shop.stall_state } }
    end

    assert_redirected_to shop_url(Shop.last)
  end

  test "should show shop" do
    get shop_url(@shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_url(@shop)
    assert_response :success
  end

  test "should update shop" do
    patch shop_url(@shop), params: { shop: { building_id: @shop.building_id, stall_addres: @shop.stall_addres, stall_city: @shop.stall_city, stall_details: @shop.stall_details, stall_link: @shop.stall_link, stall_name: @shop.stall_name, stall_pincode: @shop.stall_pincode, stall_registraton_status: @shop.stall_registraton_status, stall_state: @shop.stall_state } }
    assert_redirected_to shop_url(@shop)
  end

  test "should destroy shop" do
    assert_difference("Shop.count", -1) do
      delete shop_url(@shop)
    end

    assert_redirected_to shops_url
  end
end
