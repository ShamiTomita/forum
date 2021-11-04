class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  private

  def redirect_if_not_logged_in
    redirect_to login_path if !logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def clear_session(*args)
    args.each do |session_key|
      session[session_key] = nil
    end
  end
end
