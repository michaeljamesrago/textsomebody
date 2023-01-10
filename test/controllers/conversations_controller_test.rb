require "test_helper"

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  TEST_NUMBER = "9876543210"

  test "should get new" do
    get new_conversation_path
    assert_response :success
    assert_template :new
  end

  test "should get show" do
    get conversation_path(conversations(:one))
    assert_response :success
    assert_template :show
  end

  test "should respond unprocessable entity if params invalid" do
    post conversations_path, params: { conversation: { number: "INVALID"} }
    assert_response :unprocessable_entity
    assert_template :new
  end
end
