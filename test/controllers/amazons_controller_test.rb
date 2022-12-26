require "test_helper"

class AmazonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get amazons_index_url
    assert_response :success
  end

  test "should get edit" do
    get amazons_edit_url
    assert_response :success
  end

  test "should get show" do
    get amazons_show_url
    assert_response :success
  end

  test "should get create" do
    get amazons_create_url
    assert_response :success
  end
end
