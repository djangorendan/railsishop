require 'test_helper'

class ComparesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compare = compares(:one)
  end

  test "should get index" do
    get compares_url
    assert_response :success
  end

  test "should get new" do
    get new_compare_url
    assert_response :success
  end

  test "should create compare" do
    assert_difference('Compare.count') do
      post compares_url, params: { compare: {  } }
    end

    assert_redirected_to compare_url(Compare.last)
  end

  test "should show compare" do
    get compare_url(@compare)
    assert_response :success
  end

  test "should get edit" do
    get edit_compare_url(@compare)
    assert_response :success
  end

  test "should update compare" do
    patch compare_url(@compare), params: { compare: {  } }
    assert_redirected_to compare_url(@compare)
  end

  test "should destroy compare" do
    assert_difference('Compare.count', -1) do
      delete compare_url(@compare)
    end

    assert_redirected_to compares_url
  end
end
