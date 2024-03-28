class V1::MessagesController < V1::ApplicationController
  before_action :set_chat, only: [:index, :create, :search]
  before_action :set_message, only: [:destroy]

  def index
    messages = @chat.messages
    render json: V1::MessagesSerializer.render(messages), status: :ok
  end

  def create
    message = Message.new(message_params)
    message.chat = @chat
    message.number = increment_message_number
    message.created_at = Time.current
    message.updated_at = Time.current
    $redis.sadd(@chat.id.to_s, message.to_json)
    InsertRedisMessagesIntoDatabaseJob.perform_later(@chat.id)
    render json: V1::MessagesSerializer.render(message), status: :created
  end

  def search
    message = Message.search(params[:q], @chat.id.to_s)
    render json: message.as_json(except: [:id])
  end

  def destroy
    DestroyMessageJob.perform_later(@message.id)
  end

  private

  def increment_message_number
    $redis.smembers(@chat.id.to_s).last.present? ? JSON.parse($redis.smembers(@chat.id.to_s).last)["number"] + 1 : 1
  end

  def set_message
    @message = Message.find_by(number: params[:message_number])
  end

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
