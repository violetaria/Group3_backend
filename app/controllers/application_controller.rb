class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user

  def current_user
    key = request.headers['Access-Key']
    key && User.find_by(access_key: key)
  end

  def authenticate_user!
    unless current_user
      key = request.headers['Access-Key']
      render json: { error: "Could not authenticate with access key:'#{key}'" },
             status: :unauthorized
    end
  end
end
