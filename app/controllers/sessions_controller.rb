class SessionsController < ApplicationController
  def new
    env['warden'].logout
    flash.now.alert = warden.message if warden.message.present?
  end

  def create
    warden.authenticate!
    redirect_to root_url, notice: "Logged in!"
  end

  def destroy
    env['warden'].logout
    redirect_to root_url, notice: "Logged out!"
  end
end
