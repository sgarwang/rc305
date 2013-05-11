class SessionsController < ApplicationController
  def new
    # We can see Warden has powerful 'scope' feature, default :user.
    # We need to figure out a way to avoid session info being destroyed.
    #
    # http://stackoverflow.com/questions/10153040/stop-devise-from-clearing-session
    #
    # If you use devise:
    # https://github.com/plataformatec/devise/wiki/How-To%3A-Redirect-to-a-specific-page-when-the-user-can-not-be-authenticated
    #
    # http://www.slideshare.net/tonywok/demystifying-warden
    #
    # env['warden'].session[:key] = "value"
    # env['warden'].session(:sudo)[:key] = "a different value"
    # 
    # Get the data
    # env['warden'].session[:return_to] = request.referer
    # env['warden'].session(:rc305)[:return_to]

    # binding.pry
    @path = params[:path]
    env['warden'].authenticate!(:forever, :scope => :rc305) 
    env['warden'].session(:rc305)[:return_to] = request.referer
    # env['warden'].session[:return_to] = request.referer

    env['warden'].logout(:default)
    flash.now.alert = warden.message if warden.message.present?
    puts "referer=#{request.referer} user_return_to=#{session[:return_to]} after"
  end

  def create
    puts "referer=#{request.referer} user_return_to=#{session[:return_to]}"

    warden.authenticate!

    # something like after_sign_in_path_for()
    if (return_to = params[:path])
      session[:return_to] = nil
      redirect_to return_to
    elsif (return_to = session[:return_to])
      session[:return_to] = nil
      redirect_to return_to
    elsif (return_to = env['warden'].session(:rc305)[:return_to])
      puts("return_to=#{return_to} rc305")
      session[:return_to] = nil
      redirect_to return_to
    else
      redirect_to root_url, notice: "Logged in!"
    end
  end

  def destroy
    env['warden'].logout
    redirect_to root_url, notice: "Logged out!"
  end
end
