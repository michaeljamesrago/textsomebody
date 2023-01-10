require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @conversation = conversations(:one)
  end

  test "should respond no content" do
    post conversation_messages_path(@conversation), params: { message: { body: "Hello" } }
    assert_response :no_content
  end
end
