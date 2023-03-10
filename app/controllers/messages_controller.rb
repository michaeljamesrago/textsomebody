class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(msg_params)
    if @message.save
      @conversation.send_sms(params[:message][:body])
    end
  end

  private

    def msg_params
      params.require(:message).permit(:body)
    end
end
