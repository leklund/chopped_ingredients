require 'test_helper'

class Admin::JudgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @judge = judges(:one)
  end

  test "should get index" do
    get admin_judges_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_judge_url
    assert_response :success
  end

  test "should create judge" do
    assert_difference('Judge.count') do
      post admin_judges_url, params: { judge: { name: @judge.name } }
    end

    assert_redirected_to admin_judge_url(Judge.last)
  end

  test "should show judge" do
    get admin_judge_url(@judge)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_judge_url(@judge)
    assert_response :success
  end

  test "should update judge" do
    patch admin_judge_url(@judge), params: { judge: { name: @judge.name } }
    assert_redirected_to admin_judge_url(@judge)
  end

  test "should destroy judge" do
    assert_difference('Judge.count', -1) do
      delete admin_judge_url(@judge)
    end

    assert_redirected_to admin_judges_url
  end
end
