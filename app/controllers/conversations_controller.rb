class ConversationsController < ApplicationController
  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      redirect_to @conversation
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end

  private

    def conversation_params
      params.require(:conversation).permit(:number)
    end
end
