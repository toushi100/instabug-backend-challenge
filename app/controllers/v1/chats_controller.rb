class V1::ChatsController < V1::ApplicationController
  before_action :set_application, only: [:index, :create, :show]
  before_action :set_chat, only: [:show]

  def index
    chats = @application.chats
    render json: V1::ChatsSerializer.render(chats), status: :ok
  end

  def show
    render json: V1::ChatsSerializer.render(@chat), status: :ok
  end

  def create
    create_chat_job = CreateChatJob.perform_later(@application.id)
    render json: { job_id: create_chat_job.job_id }, status: :ok
  end

  private

  def set_application
    @application = Application.find_by(token: params[:token])
  end

  def set_chat
    @chat = @application.chats.find_by(number: params[:number])
  end

  def application_params
    params.require(:application).permit(:name)
  end
end
