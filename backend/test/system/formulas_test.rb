require "application_system_test_case"

class FormulasTest < ApplicationSystemTestCase
  setup do
    @formula = formulas(:one)
  end

  test "visiting the index" do
    visit formulas_url
    assert_selector "h1", text: "Formulas"
  end

  test "should create formula" do
    visit formulas_url
    click_on "New formula"

    fill_in "Description", with: @formula.description
    fill_in "Name", with: @formula.name
    fill_in "State", with: @formula.state
    click_on "Create Formula"

    assert_text "Formula was successfully created"
    click_on "Back"
  end

  test "should update Formula" do
    visit formula_url(@formula)
    click_on "Edit this formula", match: :first

    fill_in "Description", with: @formula.description
    fill_in "Name", with: @formula.name
    fill_in "State", with: @formula.state
    click_on "Update Formula"

    assert_text "Formula was successfully updated"
    click_on "Back"
  end

  test "should destroy Formula" do
    visit formula_url(@formula)
    click_on "Destroy this formula", match: :first

    assert_text "Formula was successfully destroyed"
  end
end
