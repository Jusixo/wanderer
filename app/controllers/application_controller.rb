class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  # Assign the current user
  def current_user=(user)
    session[:user_id] = user.id
  end

  def current_admin=(admin)
    session[:admin_id] = admin.id
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end
  helper_method :current_admin

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  # Returns a boolean representing if the user is logged in
  def user_logged_in?
    !!current_user
  end
  helper_method :user_logged_in?

  def admin_logged_in?
    !!current_admin
  end
  helper_method :admin_logged_in?

  # Method to use in filter to ensure the user is logged in
  def authenticate!
    unless user_logged_in? || admin_logged_in?
      redirect_to auth_path(provider: 'facebook')
    end
  end

end
