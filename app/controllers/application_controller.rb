class ApplicationController < ActionController::Base
  # We're an API, everything is cross site.
  # protect_from_forgery with: :exception
  respond_to :html, :json

  def authorize_api_user!
    Rails.logger.debug("Auth Header: #{request.headers['Authorization']}")
    @current_user = User.api_user(request.headers['Authorization'])
    unless @current_user.present?
      render json: {error: "You must register or log in to continue"}, status: :unauthorized
    end
    true
  end
end
