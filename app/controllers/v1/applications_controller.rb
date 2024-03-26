class V1::ApplicationsController < V1::ApplicationController
  before_action :set_application, only: [:show, :update]

  def index
    applications = Application.all
    render json: V1::ApplicationsSerializer.render(applications), status: :ok
  end

  def show
    render json: V1::ApplicationsSerializer.render(@application), status: :ok
  end

  def create
    application = Application.new(application_params)
    if application.save
      render json: V1::ApplicationsSerializer.render(application), status: :created
    else
      render_error(application)
    end
  end

  def update
    if @application.update(application_params)
      render json: V1::ApplicationsSerializer.render(@application), status: :ok
    else
      render_errors(@application)
    end
  end

  private

  def set_application
    @application = Application.find_by(token: params[:token])
  end

  def application_params
    params.require(:application).permit(:name)
  end
end
