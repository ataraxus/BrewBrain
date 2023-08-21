require "application_system_test_case"

class FormulaStepsTest < ApplicationSystemTestCase
  setup do
    @formula_step = formula_steps(:one)
  end

  test "visiting the index" do
    visit formula_steps_url
    assert_selector "h1", text: "Formula steps"
  end

  test "should create formula step" do
    visit formula_steps_url
    click_on "New formula step"

    fill_in "Description", with: @formula_step.description
    fill_in "Formula", with: @formula_step.formula_id
    fill_in "Name", with: @formula_step.name
    click_on "Create Formula step"

    assert_text "Formula step was successfully created"
    click_on "Back"
  end

  test "should update Formula step" do
    visit formula_step_url(@formula_step)
    click_on "Edit this formula step", match: :first

    fill_in "Description", with: @formula_step.description
    fill_in "Formula", with: @formula_step.formula_id
    fill_in "Name", with: @formula_step.name
    click_on "Update Formula step"

    assert_text "Formula step was successfully updated"
    click_on "Back"
  end

  test "should destroy Formula step" do
    visit formula_step_url(@formula_step)
    click_on "Destroy this formula step", match: :first

    assert_text "Formula step was successfully destroyed"
  end
end
