Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :password

  # action will only be called dynamically and the form will reload dynamically in development.
  manager.failure_app = lambda { |env| SessionsController.action(:new).call(env) }
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find(id)
end

# Not working due to fail accessing 'session'
# https://github.com/hassox/warden/wiki/callbacks
#
# Warden::Manager.before_logout do |user,auth,opts|
#   puts "@returen_to=#{@returen_to} return_to=#{session[:return_to]} before_logout"
#   @returen_to = session[:return_to] 
# end
# 
# Warden::Manager.after_authentication do |user,auth,opts|
#   session[:return_to] = @returen_to
#   puts "@returen_to=#{@returen_to}  return_to=#{session[:return_to]} after_authentication"
# end

Warden::Strategies.add(:password) do

  # Seems not being used
  def valid?
    params['email'] && params['password']
  end

  def authenticate!
    user = User.find_by_email(params['email'])
    if user && user.authenticate(params['password'])
      success! user
    else
      fail "Invalid email or password"
    end
  end
end

# env['warden'].authenticate!(:forever, :scope => :rc305)        # Authenticate the :rc305 scope with the :forever strategy
Warden::Strategies.add(:forever) do
  def authenticate!
    user = User.last
    success! user
  end
end

Warden::Manager.after_authentication do |user,auth,opts|
  # http://stackoverflow.com/questions/7679864/how-to-access-session-from-warden-devise-after-authentication-callback-in-rails
  puts "raw_session=#{auth.raw_session.inspect}"
end