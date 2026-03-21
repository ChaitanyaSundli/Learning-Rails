class ApplicationController < ActionController::Base
  
  include ExceptionHandler
  
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  def render_success(data = {}, status = :ok, message = nil)
    render json: {
      success: true,
      message: message,
      data: format_data(data)
    }, status: status
  end

  def render_error(errors = [], status = :unprocessable_entity)
    render json: {
      success: false,
      errors: Array(errors)
    }, status: status
  end

  def render_not_found(message = "Resource not found")
    render json: {
      success: false,
      error: message
    }, status: :not_found
  end

  def format_data(data)
    if data.respond_to?(:as_json)
      data.as_json(except: %i[created_at updated_at])
    else
      data
    end
  end

  def route_not_found
    render json: { message: "Route not found" }, status: :not_found
  end

end
