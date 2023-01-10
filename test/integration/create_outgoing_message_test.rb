require "test_helper"

class CreateOutgoingMessageTest < ActionDispatch::IntegrationTest
  def setup
    @conversation = conversations(:one)
  end

  test "should create new message" do
    assert_difference "@conversation.messages.count", 1 do
      post conversation_messages_path(@conversation), params: { message: { body: "Hello" } }
    end
  end

  test "should not create new message if invalid" do
    assert_no_difference "@conversation.messages.count" do
      post conversation_messages_path(@conversation), params: { message: { body: "" } }
    end
  end
end
