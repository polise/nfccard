require 'test_helper'

class RandomUrlsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get url_id:" do
    get :url_id:
    assert_response :success
  end

  test "should get integer," do
    get :integer,
    assert_response :success
  end

  test "should get url_1:" do
    get :url_1:
    assert_response :success
  end

  test "should get string," do
    get :string,
    assert_response :success
  end

  test "should get url_2:" do
    get :url_2:
    assert_response :success
  end

  test "should get string," do
    get :string,
    assert_response :success
  end

  test "should get url_3:string" do
    get :url_3:string
    assert_response :success
  end
end
