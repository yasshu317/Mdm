require 'test_helper'

class EmailAccessesControllerTest < ActionController::TestCase
  setup do
    @email_access = email_accesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_accesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_access" do
    assert_difference('EmailAccess.count') do
      post :create, email_access: { identifier: @email_access.identifier, mail_server: @email_access.mail_server }
    end

    assert_redirected_to email_access_path(assigns(:email_access))
  end

  test "should show email_access" do
    get :show, id: @email_access
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_access
    assert_response :success
  end

  test "should update email_access" do
    patch :update, id: @email_access, email_access: { identifier: @email_access.identifier, mail_server: @email_access.mail_server }
    assert_redirected_to email_access_path(assigns(:email_access))
  end

  test "should destroy email_access" do
    assert_difference('EmailAccess.count', -1) do
      delete :destroy, id: @email_access
    end

    assert_redirected_to email_accesses_path
  end
end
