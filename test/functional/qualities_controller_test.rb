require 'test_helper'

class QualitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qualities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qualities" do
    assert_difference('Qualities.count') do
      post :create, :qualities => { }
    end

    assert_redirected_to qualities_path(assigns(:qualities))
  end

  test "should show qualities" do
    get :show, :id => qualities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => qualities(:one).to_param
    assert_response :success
  end

  test "should update qualities" do
    put :update, :id => qualities(:one).to_param, :qualities => { }
    assert_redirected_to qualities_path(assigns(:qualities))
  end

  test "should destroy qualities" do
    assert_difference('Qualities.count', -1) do
      delete :destroy, :id => qualities(:one).to_param
    end

    assert_redirected_to qualities_path
  end
end
