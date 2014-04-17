require 'test_helper'

class ManagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get upload" do
    get :upload
    assert_response :success
  end

end
