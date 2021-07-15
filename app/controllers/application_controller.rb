require "#{Rails.root}/lib/api_errors/base_error"

class ApplicationController < ActionController::API
  rescue_from ApiErrors::BaseError, with: :render_error_response

  private
  def render_error_response(e)
    render json: { status: e.status, message: e.message, errors: e.errors }, status: e.status
  end
end
