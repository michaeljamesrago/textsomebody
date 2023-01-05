class Conversation < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  has_many :messages

  def send_sms(body)
    if ENV["RAILS_ENV"] != "development"
      client = Twilio::REST::Client.new
      client.messages.create(
        from: ENV['TWILIO_FROM_NUMBER'],
        body: body,
        to: number
      )
    end
  end
end
