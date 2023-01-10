require "test_helper"

class ConversationTest < ActiveSupport::TestCase
  def setup
    @conversation = conversations(:one)
  end

  test "should be valid" do
    assert @conversation.valid?
  end

  test "number should be present" do
    @conversation.number = "   "
    assert_not @conversation.valid?
  end

  test "should not allow duplicate numbers" do
    conversation_dup = @conversation.dup
    assert_not conversation_dup.valid?
    conversation_dup.number = "1112223333"
    assert conversation_dup.valid?
  end

  test "bad number should not be valid" do
    @conversation.number = "22344567l1"
    assert_not @conversation.valid?
  end
end
