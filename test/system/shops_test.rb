require "application_system_test_case"

class ShopsTest < ApplicationSystemTestCase
  setup do
    @shop = shops(:one)
  end

  test "visiting the index" do
    visit shops_url
    assert_selector "h1", text: "Shops"
  end

  test "should create shop" do
    visit shops_url
    click_on "New shop"

    fill_in "Building", with: @shop.building_id
    fill_in "Stall addres", with: @shop.stall_addres
    fill_in "Stall city", with: @shop.stall_city
    fill_in "Stall details", with: @shop.stall_details
    fill_in "Stall link", with: @shop.stall_link
    fill_in "Stall name", with: @shop.stall_name
    fill_in "Stall pincode", with: @shop.stall_pincode
    check "Stall registraton status" if @shop.stall_registraton_status
    fill_in "Stall state", with: @shop.stall_state
    click_on "Create Shop"

    assert_text "Shop was successfully created"
    click_on "Back"
  end

  test "should update Shop" do
    visit shop_url(@shop)
    click_on "Edit this shop", match: :first

    fill_in "Building", with: @shop.building_id
    fill_in "Stall addres", with: @shop.stall_addres
    fill_in "Stall city", with: @shop.stall_city
    fill_in "Stall details", with: @shop.stall_details
    fill_in "Stall link", with: @shop.stall_link
    fill_in "Stall name", with: @shop.stall_name
    fill_in "Stall pincode", with: @shop.stall_pincode
    check "Stall registraton status" if @shop.stall_registraton_status
    fill_in "Stall state", with: @shop.stall_state
    click_on "Update Shop"

    assert_text "Shop was successfully updated"
    click_on "Back"
  end

  test "should destroy Shop" do
    visit shop_url(@shop)
    accept_confirm { click_on "Destroy this shop", match: :first }

    assert_text "Shop was successfully destroyed"
  end
end
