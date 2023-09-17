require "test_helper"

class MaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material = materials(:one)
  end

  test "should get index" do
    get materials_url
    assert_response :success
  end

  test "should get new" do
    get new_material_url
    assert_response :success
  end

  test "should create material" do
    assert_difference("Material.count") do
      post materials_url, params: {material: {amount_in_kg: @material.amount_in_kg, description: @material.description, ingredient_id: @material.ingredient_id, lot_number: @material.lot_number, name: @material.name, state: @material.state}}
    end

    assert_redirected_to material_url(Material.last)
  end

  test "should show material" do
    get material_url(@material)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_url(@material)
    assert_response :success
  end

  test "should update material" do
    patch material_url(@material), params: {material: {amount_in_kg: @material.amount_in_kg, description: @material.description, ingredient_id: @material.ingredient_id, lot_number: @material.lot_number, name: @material.name, state: @material.state}}
    assert_redirected_to material_url(@material)
  end

  test "should destroy material" do
    assert_difference("Material.count", -1) do
      delete material_url(@material)
    end

    assert_redirected_to materials_url
  end
end
