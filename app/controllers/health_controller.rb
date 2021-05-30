class HealthController < ApplicationController
  skip_before_action :authorize_request
  def index
    render json: { status: 'success' }
  end
end
