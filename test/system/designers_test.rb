require "application_system_test_case"

class DesignersTest < ApplicationSystemTestCase
  setup do
    @designer = designers(:one)
  end

  test "visiting the index" do
    visit designers_url
    assert_selector "h1", text: "Designers"
  end

  test "should create designer" do
    visit designers_url
    click_on "New designer"

    fill_in "Name", with: @designer.name
    fill_in "Website", with: @designer.website
    click_on "Create Designer"

    assert_text "Designer was successfully created"
    click_on "Back"
  end

  test "should update Designer" do
    visit designer_url(@designer)
    click_on "Edit this designer", match: :first

    fill_in "Name", with: @designer.name
    fill_in "Website", with: @designer.website
    click_on "Update Designer"

    assert_text "Designer was successfully updated"
    click_on "Back"
  end

  test "should destroy Designer" do
    visit designer_url(@designer)
    click_on "Destroy this designer", match: :first

    assert_text "Designer was successfully destroyed"
  end
end
