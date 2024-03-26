class V1::MessagesController < V1::ApplicationController
  before_action :set_chat, only: [:index, :create]

  def index
    messages = @chat.messages
    render json: V1::MessagesSerializer.render(messages), status: :ok
  end

  def create
    message = Message.new(message_params)
    message.chat = @chat
    if message.save
      render json: V1::MessagesSerializer.render(message), status: :created
    else
      render_error(message)
    end
  end
def search
  q= search_params[:q]
  messages = @chat.messages
end
  private

  def set_chat
    application = Application.find_by(token: params[:token])
    @chat = application.chats.find_by(number: params[:number])
  end

  def message_params
    params.require(:message).permit(:body)
  end
  def search_params
    params.require(:message).permit(:q)
  end
end
