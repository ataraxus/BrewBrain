require "test_helper"

class FormulaStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formula_step = formula_steps(:one)
  end

  test "should get index" do
    get formula_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_formula_step_url
    assert_response :success
  end

  test "should create formula_step" do
    assert_difference("FormulaStep.count") do
      post formula_steps_url, params: { formula_step: { description: @formula_step.description, formula_id: @formula_step.formula_id, name: @formula_step.name } }
    end

    assert_redirected_to formula_step_url(FormulaStep.last)
  end

  test "should show formula_step" do
    get formula_step_url(@formula_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_formula_step_url(@formula_step)
    assert_response :success
  end

  test "should update formula_step" do
    patch formula_step_url(@formula_step), params: { formula_step: { description: @formula_step.description, formula_id: @formula_step.formula_id, name: @formula_step.name } }
    assert_redirected_to formula_step_url(@formula_step)
  end

  test "should destroy formula_step" do
    assert_difference("FormulaStep.count", -1) do
      delete formula_step_url(@formula_step)
    end

    assert_redirected_to formula_steps_url
  end
end
