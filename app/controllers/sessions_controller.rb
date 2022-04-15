class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if the user exists and the password is correct
    if user && user.authenticate(params[:password])
      # save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website
      session[:id] = user.id
      redirect_to '/'
    else
      # if the user's login doesn't work, send them back to the login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to '/login'
  end

end
