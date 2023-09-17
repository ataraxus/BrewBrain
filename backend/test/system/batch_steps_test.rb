require "application_system_test_case"

class BatchStepsTest < ApplicationSystemTestCase
  setup do
    @batch_step = batch_steps(:one)
  end

  test "visiting the index" do
    visit batch_steps_url
    assert_selector "h1", text: "Batch steps"
  end

  test "should create batch step" do
    visit batch_steps_url
    click_on "New batch step"

    fill_in "Batch", with: @batch_step.batch_id
    fill_in "Description", with: @batch_step.description
    fill_in "Name", with: @batch_step.name
    fill_in "Asset", with: @batch_step.asset_id
    click_on "Create Batch step"

    assert_text "Batch step was successfully created"
    click_on "Back"
  end

  test "should update Batch step" do
    visit batch_step_url(@batch_step)
    click_on "Edit this batch step", match: :first

    fill_in "Batch", with: @batch_step.batch_id
    fill_in "Description", with: @batch_step.description
    fill_in "Name", with: @batch_step.name
    fill_in "ra ", with: @batch_step.asset_id
    click_on "Update Batch step"

    assert_text "Batch step was successfully updated"
    click_on "Back"
  end

  test "should destroy Batch step" do
    visit batch_step_url(@batch_step)
    click_on "Destroy this batch step", match: :first

    assert_text "Batch step was successfully destroyed"
  end
end
