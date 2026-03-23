module ExceptionHandler
  extend ActiveSupport::Concern

  included do

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    rescue_from ActionController::ParameterMissing do |e|
      render json: { message: e.message }, status: :bad_request
    end

    rescue_from ActiveRecord::RecordNotUnique do |e|
      render json: { message: "Record already exists" }, status: :unprocessable_entity
    end

    rescue_from ActionController::RoutingError do |e|
      render json: { message: "Route not found: #{e.message}" }, status: :not_found
    end
  end
end
