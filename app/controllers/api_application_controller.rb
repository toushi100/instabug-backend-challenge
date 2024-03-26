class ApiApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def record_not_found(exception)
    render_error(exception.message, status: :not_found, details: "Resource not found")
  end

  def parameter_missing(exception)
    render_error(exception.message, status: :unprocessable_entity, details: "Parameter missing")
  end

  def render_error(errors, options = {})
    adapter = ApiError.new(errors, options)
    render json: V1::ErrorSerializer.render(adapter), status: adapter.status
  end

  def current_serializer_view
    view = :default
    view = params[:view_name].to_sym if params[:view_name].present?
    return view
  end
end
