class ApplicationController < ActionController::API
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def api_error(messages, status = 400)
    render json: {error: { messages: Array.wrap(messages) }}, status: status
  end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
