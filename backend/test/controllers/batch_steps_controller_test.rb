require "test_helper"

class BatchStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @batch_step = batch_steps(:one)
  end

  test "should get index" do
    get batch_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_batch_step_url
    assert_response :success
  end

  test "should create batch_step" do
    assert_difference("BatchStep.count") do
      post batch_steps_url, params: {batch_step: {batch_id: @batch_step.batch_id, description: @batch_step.description, name: @batch_step.name, resource_id: @batch_step.resource_id}}
    end

    assert_redirected_to batch_step_url(BatchStep.last)
  end

  test "should show batch_step" do
    get batch_step_url(@batch_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_batch_step_url(@batch_step)
    assert_response :success
  end

  test "should update batch_step" do
    patch batch_step_url(@batch_step), params: {batch_step: {batch_id: @batch_step.batch_id, description: @batch_step.description, name: @batch_step.name, resource_id: @batch_step.resource_id}}
    assert_redirected_to batch_step_url(@batch_step)
  end

  test "should destroy batch_step" do
    assert_difference("BatchStep.count", -1) do
      delete batch_step_url(@batch_step)
    end

    assert_redirected_to batch_steps_url
  end
end
