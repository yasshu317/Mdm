require 'test_helper'

class InternalSettingsControllerTest < ActionController::TestCase
  setup do
    @internal_setting = internal_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internal_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internal_setting" do
    assert_difference('InternalSetting.count') do
      post :create, internal_setting: { name: @internal_setting.name }
    end

    assert_redirected_to internal_setting_path(assigns(:internal_setting))
  end

  test "should show internal_setting" do
    get :show, id: @internal_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internal_setting
    assert_response :success
  end

  test "should update internal_setting" do
    patch :update, id: @internal_setting, internal_setting: { name: @internal_setting.name }
    assert_redirected_to internal_setting_path(assigns(:internal_setting))
  end

  test "should destroy internal_setting" do
    assert_difference('InternalSetting.count', -1) do
      delete :destroy, id: @internal_setting
    end

    assert_redirected_to internal_settings_path
  end
end
