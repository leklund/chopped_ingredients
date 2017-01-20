require 'test_helper'

class Admin::ContestantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contestant = contestants(:one)
  end

  test "should get index" do
    get admin_contestants_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_contestant_url
    assert_response :success
  end

  test "should create contestant" do
    assert_difference('Contestant.count') do
      post admin_contestants_url, params: { contestant: { description: @contestant.description, name: @contestant.name, placing: @contestant.placing, show_id: @contestant.show_id } }
    end

    assert_redirected_to admin_contestant_url(Contestant.last)
  end

  test "should show contestant" do
    get admin_contestant_url(@contestant)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_contestant_url(@contestant)
    assert_response :success
  end

  test "should update contestant" do
    patch admin_contestant_url(@contestant), params: { contestant: { description: @contestant.description, name: @contestant.name, placing: @contestant.placing, show_id: @contestant.show_id } }
    assert_redirected_to admin_contestant_url(@contestant)
  end

  test "should destroy contestant" do
    assert_difference('Contestant.count', -1) do
      delete admin_contestant_url(@contestant)
    end

    assert_redirected_to admin_contestants_url
  end
end
