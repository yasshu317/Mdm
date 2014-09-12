require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { access_to_os: @profile.access_to_os, call_recording: @profile.call_recording, camera: @profile.camera, default_call_duration: @profile.default_call_duration, device_mode: @profile.device_mode, email_access_id: @profile.email_access_id, gprs: @profile.gprs, internal_setting_id: @profile.internal_setting_id, profile_name: @profile.profile_name, ringtone_id: @profile.ringtone_id, secure_pictures: @profile.secure_pictures, set_password: @profile.set_password, spy_recording: @profile.spy_recording, status: @profile.status, timezone: @profile.timezone, wallpaper_id: @profile.wallpaper_id, wifi: @profile.wifi }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    patch :update, id: @profile, profile: { access_to_os: @profile.access_to_os, call_recording: @profile.call_recording, camera: @profile.camera, default_call_duration: @profile.default_call_duration, device_mode: @profile.device_mode, email_access_id: @profile.email_access_id, gprs: @profile.gprs, internal_setting_id: @profile.internal_setting_id, profile_name: @profile.profile_name, ringtone_id: @profile.ringtone_id, secure_pictures: @profile.secure_pictures, set_password: @profile.set_password, spy_recording: @profile.spy_recording, status: @profile.status, timezone: @profile.timezone, wallpaper_id: @profile.wallpaper_id, wifi: @profile.wifi }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
