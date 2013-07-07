require 'test_helper'

class SliderControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get upload" do
    get :upload
    assert_response :success
  end

  test "should get upload_process" do
    get :upload_process
    assert_response :success
  end

end
