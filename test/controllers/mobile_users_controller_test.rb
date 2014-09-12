require 'test_helper'

class MobileUsersControllerTest < ActionController::TestCase
  setup do
    @mobile_user = mobile_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mobile_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mobile_user" do
    assert_difference('MobileUser.count') do
      post :create, mobile_user: { dob: @mobile_user.dob, employee_id: @mobile_user.employee_id, first_name: @mobile_user.first_name, gender: @mobile_user.gender, group_id: @mobile_user.group_id, last_name: @mobile_user.last_name, mobile: @mobile_user.mobile, password: @mobile_user.password, user_name: @mobile_user.user_name }
    end

    assert_redirected_to mobile_user_path(assigns(:mobile_user))
  end

  test "should show mobile_user" do
    get :show, id: @mobile_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mobile_user
    assert_response :success
  end

  test "should update mobile_user" do
    patch :update, id: @mobile_user, mobile_user: { dob: @mobile_user.dob, employee_id: @mobile_user.employee_id, first_name: @mobile_user.first_name, gender: @mobile_user.gender, group_id: @mobile_user.group_id, last_name: @mobile_user.last_name, mobile: @mobile_user.mobile, password: @mobile_user.password, user_name: @mobile_user.user_name }
    assert_redirected_to mobile_user_path(assigns(:mobile_user))
  end

  test "should destroy mobile_user" do
    assert_difference('MobileUser.count', -1) do
      delete :destroy, id: @mobile_user
    end

    assert_redirected_to mobile_users_path
  end
end
