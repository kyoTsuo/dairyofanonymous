require 'test_helper'

class DairiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dairies_index_url
    assert_response :success
  end

  test "should get show" do
    get dairies_show_url
    assert_response :success
  end

  test "should get new" do
    get dairies_new_url
    assert_response :success
  end

  test "should get edit" do
    get dairies_edit_url
    assert_response :success
  end

end
