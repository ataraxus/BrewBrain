require "test_helper"

class FormulaCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formula_category = formula_categories(:one)
  end

  test "should get index" do
    get formula_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_formula_category_url
    assert_response :success
  end

  test "should create formula_category" do
    assert_difference("FormulaCategory.count") do
      post formula_categories_url, params: { formula_category: { description: @formula_category.description, name: @formula_category.name } }
    end

    assert_redirected_to formula_category_url(FormulaCategory.last)
  end

  test "should show formula_category" do
    get formula_category_url(@formula_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_formula_category_url(@formula_category)
    assert_response :success
  end

  test "should update formula_category" do
    patch formula_category_url(@formula_category), params: { formula_category: { description: @formula_category.description, name: @formula_category.name } }
    assert_redirected_to formula_category_url(@formula_category)
  end

  test "should destroy formula_category" do
    assert_difference("FormulaCategory.count", -1) do
      delete formula_category_url(@formula_category)
    end

    assert_redirected_to formula_categories_url
  end
end
