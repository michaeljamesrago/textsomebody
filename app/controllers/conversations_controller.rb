class ConversationsController < ApplicationController
  def new
    if !!session[:conversation_id] && (conversation = Conversation.find(session[:conversation_id]))
      redirect_to conversation_path(conversation.token)
    else
      @conversation = Conversation.new
    end
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      session[:conversation_id] = @conversation.id
      redirect_to conversation_path(@conversation.token)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @conversation = Conversation.find_by(token: params[:id])
    redirect_to root_path unless @conversation
    @message = Message.new
  end

  private

    def conversation_params
      params.require(:conversation).permit(:number)
    end
end
