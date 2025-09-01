require "application_system_test_case"

class MenuCatogariesTest < ApplicationSystemTestCase
  setup do
    @menu_catogary = menu_catogaries(:one)
  end

  test "visiting the index" do
    visit menu_catogaries_url
    assert_selector "h1", text: "Menu catogaries"
  end

  test "should create menu catogary" do
    visit menu_catogaries_url
    click_on "New menu catogary"

    fill_in "Menu", with: @menu_catogary.menu_id
    fill_in "Name", with: @menu_catogary.name
    click_on "Create Menu catogary"

    assert_text "Menu catogary was successfully created"
    click_on "Back"
  end

  test "should update Menu catogary" do
    visit menu_catogary_url(@menu_catogary)
    click_on "Edit this menu catogary", match: :first

    fill_in "Menu", with: @menu_catogary.menu_id
    fill_in "Name", with: @menu_catogary.name
    click_on "Update Menu catogary"

    assert_text "Menu catogary was successfully updated"
    click_on "Back"
  end

  test "should destroy Menu catogary" do
    visit menu_catogary_url(@menu_catogary)
    accept_confirm { click_on "Destroy this menu catogary", match: :first }

    assert_text "Menu catogary was successfully destroyed"
  end
end
