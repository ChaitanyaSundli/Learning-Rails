class ApplicationController < ActionController::Base
  
  include ExceptionHandler
  
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  def route_not_found
    render json: { message: "Route not found" }, status: :not_found
  end

end
