class MessagesController < ApplicationController
  before_action :logged_in_user

  def index
    @messages = current_user.messages
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = current_user.messages.build if logged_in?
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      redirect_to @message
    else
      render 'new'
    end
  end

  def update
    @message = Message.find(params[:id])

    if @message.update(message_params)
      redirect_to @message
    else
      render 'edit'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to messages_path
  end

  private
    def message_params
      params.require(:message).permit(:receiver, :text)
    end
end
