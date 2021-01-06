require "test_helper"

class EmailUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get email_users" do
    get email_users_email_users_url
    assert_response :success
  end

  test "should get index" do
    get email_users_index_url
    assert_response :success
  end
end
