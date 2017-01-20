require 'test_helper'

class Admin::IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingredient = ingredients(:one)
  end

  test "should get index" do
    get admin_ingredients_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_ingredient_url
    assert_response :success
  end

  test "should create ingredient" do
    assert_difference('Ingredient.count') do
      post admin_ingredients_url, params: { ingredient: { name: @ingredient.name } }
    end

    assert_redirected_to admin_ingredient_url(Ingredient.last)
  end

  test "should show ingredient" do
    get admin_ingredient_url(@ingredient)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_ingredient_url(@ingredient)
    assert_response :success
  end

  test "should update ingredient" do
    patch admin_ingredient_url(@ingredient), params: { ingredient: { name: @ingredient.name } }
    assert_redirected_to admin_ingredient_url(@ingredient)
  end

  test "should destroy ingredient" do
    assert_difference('Ingredient.count', -1) do
      delete admin_ingredient_url(@ingredient)
    end

    assert_redirected_to admin_ingredients_url
  end
end
