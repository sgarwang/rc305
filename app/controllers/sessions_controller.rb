class SessionsController < ApplicationController
  def new
    @current_user = nil
    session[:user_id] = nil
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    @current_user = nil
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
