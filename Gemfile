source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem "bootstrap-sass", ">= 2.1.1.0"
gem "simple_form", ">= 2.0.4"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development do
  gem "thin"
  gem "rails-erd"
  gem 'spreadsheet'
  gem "quiet_assets", ">= 1.0.1"
  gem "better_errors", ">= 0.2.0"
  gem "binding_of_caller", ">= 0.6.8"
end

# group for test-related gems
group :development, :test do
  # http://nerds.airbnb.com/upgrading-from-ree-187-to-ruby-193/
  # (1) a Date object serialized by Ruby 1.8.7’s Marshal will throw an exception if you try to deserialize it using Ruby 1.9.3.
  # (2) Memcached
  #
  # http://blog.eddie.com.tw/2011/06/13/some-differences-between-ruby-1-8-and-1-9/
  gem 'debugger',     :platforms => :ruby_19
  gem "rspec-rails", ">= 2.11.4"
  gem "factory_girl_rails", ">= 4.1.0"

  # Let Pry to support rails in development environment
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-nav'
  gem 'awesome_print'
end