class ConversationsController < ApplicationController
  def new
    if !!session[:conversation_id]
      redirect_to conversation_path(session[:conversation_id])
    else
      @conversation = Conversation.new
    end
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      session[:conversation_id] = @conversation.id
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
