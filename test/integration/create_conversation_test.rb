require "test_helper"

class CreateConversationTest < ActionDispatch::IntegrationTest
  test "should accept valid submission" do
    assert_difference "Conversation.count", 1 do
      post conversations_path, params: { conversation: { number: "9998887777"} }
    end
    conversation = Conversation.find_by(number: "9998887777")
    assert_not_nil conversation
    assert_redirected_to conversation_path(conversation)
  end

  test "should not accept invalid submission" do
    assert_no_difference "Conversation.count" do
      post conversations_path, params: { conversation: { number: "INVALID" } }
    end
    assert_response :unprocessable_entity
    assert_template :new
  end
end
