class IncomingMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @conversation = Conversation.find_by(number: params[:From].slice(2, 11))
    @message = @conversation.messages.build(body: params[:Body])
    @message.incoming = true
    @message.save
    response.status = 204
  end
end
