class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
  	unless current_user
  	  puts "referer=#{request.referer} path=#{request.path}"
      # binding.pry
      # store_location
  		flash[:notice] = 'Please login first'
  		redirect_to login_path(:path => request.path), notice: 'Please login first'
  		return false
  	end    
  end

  private
    def current_user
      warden.user
    end

  helper_method :current_user

  def warden
    env['warden']
  end
end
