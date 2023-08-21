require "application_system_test_case"

class ExecutedStepsTest < ApplicationSystemTestCase
  setup do
    @executed_step = executed_steps(:one)
  end

  test "visiting the index" do
    visit executed_steps_url
    assert_selector "h1", text: "Executed steps"
  end

  test "should create executed step" do
    visit executed_steps_url
    click_on "New executed step"

    fill_in "Batch", with: @executed_step.batch_id
    fill_in "Executed at", with: @executed_step.executed_at
    fill_in "Name", with: @executed_step.name
    fill_in "Process step", with: @executed_step.process_step_id
    fill_in "State", with: @executed_step.state
    fill_in "User", with: @executed_step.user_id
    click_on "Create Executed step"

    assert_text "Executed step was successfully created"
    click_on "Back"
  end

  test "should update Executed step" do
    visit executed_step_url(@executed_step)
    click_on "Edit this executed step", match: :first

    fill_in "Batch", with: @executed_step.batch_id
    fill_in "Executed at", with: @executed_step.executed_at
    fill_in "Name", with: @executed_step.name
    fill_in "Process step", with: @executed_step.process_step_id
    fill_in "State", with: @executed_step.state
    fill_in "User", with: @executed_step.user_id
    click_on "Update Executed step"

    assert_text "Executed step was successfully updated"
    click_on "Back"
  end

  test "should destroy Executed step" do
    visit executed_step_url(@executed_step)
    click_on "Destroy this executed step", match: :first

    assert_text "Executed step was successfully destroyed"
  end
end
