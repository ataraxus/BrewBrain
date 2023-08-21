require "application_system_test_case"

class FormulaIngredientsTest < ApplicationSystemTestCase
  setup do
    @formula_ingredient = formula_ingredients(:one)
  end

  test "visiting the index" do
    visit formula_ingredients_url
    assert_selector "h1", text: "Formula ingredients"
  end

  test "should create formula ingredient" do
    visit formula_ingredients_url
    click_on "New formula ingredient"

    fill_in "Decimal", with: @formula_ingredient.decimal
    fill_in "Formula", with: @formula_ingredient.formula_id
    fill_in "Ingredient", with: @formula_ingredient.ingredient_id
    fill_in "Percentage", with: @formula_ingredient.percentage
    click_on "Create Formula ingredient"

    assert_text "Formula ingredient was successfully created"
    click_on "Back"
  end

  test "should update Formula ingredient" do
    visit formula_ingredient_url(@formula_ingredient)
    click_on "Edit this formula ingredient", match: :first

    fill_in "Decimal", with: @formula_ingredient.decimal
    fill_in "Formula", with: @formula_ingredient.formula_id
    fill_in "Ingredient", with: @formula_ingredient.ingredient_id
    fill_in "Percentage", with: @formula_ingredient.percentage
    click_on "Update Formula ingredient"

    assert_text "Formula ingredient was successfully updated"
    click_on "Back"
  end

  test "should destroy Formula ingredient" do
    visit formula_ingredient_url(@formula_ingredient)
    click_on "Destroy this formula ingredient", match: :first

    assert_text "Formula ingredient was successfully destroyed"
  end
end
