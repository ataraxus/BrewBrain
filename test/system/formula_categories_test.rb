require "application_system_test_case"

class FormulaCategoriesTest < ApplicationSystemTestCase
  setup do
    @formula_category = formula_categories(:one)
  end

  test "visiting the index" do
    visit formula_categories_url
    assert_selector "h1", text: "Formula categories"
  end

  test "should create formula category" do
    visit formula_categories_url
    click_on "New formula category"

    fill_in "Description", with: @formula_category.description
    fill_in "Name", with: @formula_category.name
    click_on "Create Formula category"

    assert_text "Formula category was successfully created"
    click_on "Back"
  end

  test "should update Formula category" do
    visit formula_category_url(@formula_category)
    click_on "Edit this formula category", match: :first

    fill_in "Description", with: @formula_category.description
    fill_in "Name", with: @formula_category.name
    click_on "Update Formula category"

    assert_text "Formula category was successfully updated"
    click_on "Back"
  end

  test "should destroy Formula category" do
    visit formula_category_url(@formula_category)
    click_on "Destroy this formula category", match: :first

    assert_text "Formula category was successfully destroyed"
  end
end
