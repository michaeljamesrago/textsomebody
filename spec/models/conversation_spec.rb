require "rails_helper"

RSpec.describe Conversation, :type => :model do
  let(:client) { instance_double('Twilio::REST::Client') }

  context "when created with an invalid number" do
    let(:conversation) { Conversation.new(number: "123456789") }
    it "should not be valid" do
      expect(conversation.valid?).to eq(false)
    end

    it "should not be savable" do
      expect(conversation.save).to be_falsey
    end
  end

  context "when created with a valid number" do
    before do
      allow(client).to receive(:messages)
        .and_return((Class.new do
          def create(arg)
            "success"
          end
        end).new)
    end
      
    let(:conversation) { Conversation.new(number: "6096758240") }
    it "should be valid" do
      expect(conversation.valid?)
    end

    it "should have a token when saved" do
      conversation.save
      expect(conversation.token).not_to be_nil
    end

    it "should send sms" do
      res = conversation.send_sms("This is a message", client)
      expect(res).to eq("success")
    end 
  end
end