require 'test_helper'

class Admin::SeasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @season = seasons(:one)
  end

  test "should get index" do
    get admin_seasons_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_season_url
    assert_response :success
  end

  test "should create season" do
    assert_difference('Season.count') do
      post admin_seasons_url, params: { season: { name: @season.name, number: @season.number } }
    end

    assert_redirected_to admin_season_url(Season.last)
  end

  test "should show season" do
    get admin_season_url(@season)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_season_url(@season)
    assert_response :success
  end

  test "should update season" do
    patch admin_season_url(@season), params: { season: { name: @season.name, number: @season.number } }
    assert_redirected_to admin_season_url(@season)
  end

  test "should destroy season" do
    assert_difference('Season.count', -1) do
      delete admin_season_url(@season)
    end

    assert_redirected_to admin_seasons_url
  end
end
