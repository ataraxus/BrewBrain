require "test_helper"

class FormulaIngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formula_ingredient = formula_ingredients(:one)
  end

  test "should get index" do
    get formula_ingredients_url
    assert_response :success
  end

  test "should get new" do
    get new_formula_ingredient_url
    assert_response :success
  end

  test "should create formula_ingredient" do
    assert_difference("FormulaIngredient.count") do
      post formula_ingredients_url, params: {formula_ingredient: {decimal: @formula_ingredient.decimal, formula_id: @formula_ingredient.formula_id, ingredient_id: @formula_ingredient.ingredient_id, percentage: @formula_ingredient.percentage}}
    end

    assert_redirected_to formula_ingredient_url(FormulaIngredient.last)
  end

  test "should show formula_ingredient" do
    get formula_ingredient_url(@formula_ingredient)
    assert_response :success
  end

  test "should get edit" do
    get edit_formula_ingredient_url(@formula_ingredient)
    assert_response :success
  end

  test "should update formula_ingredient" do
    patch formula_ingredient_url(@formula_ingredient), params: {formula_ingredient: {decimal: @formula_ingredient.decimal, formula_id: @formula_ingredient.formula_id, ingredient_id: @formula_ingredient.ingredient_id, percentage: @formula_ingredient.percentage}}
    assert_redirected_to formula_ingredient_url(@formula_ingredient)
  end

  test "should destroy formula_ingredient" do
    assert_difference("FormulaIngredient.count", -1) do
      delete formula_ingredient_url(@formula_ingredient)
    end

    assert_redirected_to formula_ingredients_url
  end
end
