class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # if the user is logged in, look up that user in the DB and then save that user object to @current_user.
  # The @current_user instance variable is related to the `authorize` method below, which checks if @current_user has been 
  # set before serving up a controller action - if @current_user hasn't been set then we don't have
  # a logged in user and therefore we need to redirect them to /login
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # see note above current_user method
  def authorize
    redirect_to '/login' unless current_user
  end
end
