require "test_helper"

class ExecutedStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @executed_step = executed_steps(:one)
  end

  test "should get index" do
    get executed_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_executed_step_url
    assert_response :success
  end

  test "should create executed_step" do
    assert_difference("ExecutedStep.count") do
      post executed_steps_url, params: { executed_step: { batch_id: @executed_step.batch_id, executed_at: @executed_step.executed_at, name: @executed_step.name, process_step_id: @executed_step.process_step_id, state: @executed_step.state, user_id: @executed_step.user_id } }
    end

    assert_redirected_to executed_step_url(ExecutedStep.last)
  end

  test "should show executed_step" do
    get executed_step_url(@executed_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_executed_step_url(@executed_step)
    assert_response :success
  end

  test "should update executed_step" do
    patch executed_step_url(@executed_step), params: { executed_step: { batch_id: @executed_step.batch_id, executed_at: @executed_step.executed_at, name: @executed_step.name, process_step_id: @executed_step.process_step_id, state: @executed_step.state, user_id: @executed_step.user_id } }
    assert_redirected_to executed_step_url(@executed_step)
  end

  test "should destroy executed_step" do
    assert_difference("ExecutedStep.count", -1) do
      delete executed_step_url(@executed_step)
    end

    assert_redirected_to executed_steps_url
  end
end
