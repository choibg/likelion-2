require 'test_helper'

class HomeworkSecondControllerTest < ActionController::TestCase
  test "should get input" do
    get :input
    assert_response :success
  end

  test "should get output" do
    get :output
    assert_response :success
  end

end
