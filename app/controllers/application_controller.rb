class ApplicationController < ActionController::API
 before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    p 'requests'
    p request.headers['Authorization']
    @current_user = AuthorizeApiRequest.call(request.headers).result
    p 'wtf' 
    p @current_user
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
