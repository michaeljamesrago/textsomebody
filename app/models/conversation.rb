class Conversation < ApplicationRecord
  has_many :messages

  before_create :create_token

  VALID_PHONE_NUMBER_REGEX = /\A[0-9]{10}\z/
  validates :number, presence: true, uniqueness: true,
                      format: { with: VALID_PHONE_NUMBER_REGEX }

  def send_sms(body)
    if !(["development", "test"].include? ENV["RAILS_ENV"])
      client = Twilio::REST::Client.new
      client.messages.create(
        from: ENV['TWILIO_FROM_NUMBER'],
        body: body,
        to: number
      )
    end
  end

  def Conversation.new_token
    SecureRandom.urlsafe_base64
  end

  private
    def create_token
      self.token = Conversation.new_token
    end
end
