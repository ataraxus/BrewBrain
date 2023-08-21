require "application_system_test_case"

class BatchesTest < ApplicationSystemTestCase
  setup do
    @batch = batches(:one)
  end

  test "visiting the index" do
    visit batches_url
    assert_selector "h1", text: "Batches"
  end

  test "should create batch" do
    visit batches_url
    click_on "New batch"

    fill_in "Amount", with: @batch.amount
    fill_in "Description", with: @batch.description
    check "Finished" if @batch.finished
    fill_in "Name", with: @batch.name
    fill_in "State", with: @batch.state
    click_on "Create Batch"

    assert_text "Batch was successfully created"
    click_on "Back"
  end

  test "should update Batch" do
    visit batch_url(@batch)
    click_on "Edit this batch", match: :first

    fill_in "Amount", with: @batch.amount
    fill_in "Description", with: @batch.description
    check "Finished" if @batch.finished
    fill_in "Name", with: @batch.name
    fill_in "State", with: @batch.state
    click_on "Update Batch"

    assert_text "Batch was successfully updated"
    click_on "Back"
  end

  test "should destroy Batch" do
    visit batch_url(@batch)
    click_on "Destroy this batch", match: :first

    assert_text "Batch was successfully destroyed"
  end
end
