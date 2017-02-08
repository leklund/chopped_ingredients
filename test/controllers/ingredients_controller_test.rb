require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingredient = ingredients(:one)
  end

  test "should get show" do
    get ingredients_url @ingredients
    assert_response :success
  end

  test "should get index" do
    get ingredients_url
    assert_response :success
  end
end
