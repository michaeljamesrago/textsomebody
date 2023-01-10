require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @conversation = conversations(:one)
    @message = @conversation.messages.build(body: "Hello Test!")
  end

  test "should be valid" do
    assert @message.valid?
  end

  test "should be invalid if body too long" do
    @message.body = "A" * 166
    assert_not @message.valid?
  end

  test "should be invalid if body is missing" do
    @message.body = ""
    assert_not @message.valid?
  end

  test "default value for incoming should be false" do
    assert_not @message.incoming
  end
end
