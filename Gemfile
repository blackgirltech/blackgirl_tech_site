source 'https://rubygems.org'
ruby "2.4.1"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg'
gem 'dotenv-rails', groups: [:development, :test]
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# LOGIN INFO

gem 'devise'
gem 'devise_invitable', '~> 1.7.0'
gem 'omniauth-oauth2', '1.3.1'
gem 'omniauth-facebook'
gem 'twitter'
gem 'omniauth-twitter'
gem "omniauth-google-oauth2"

# PAYMENT GATEWAYS
gem 'stripe'

gem 'font-awesome-sass'
gem "paperclip", "~> 6.0.0"

# Jobs
gem 'delayed_job_active_record'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bdd-rails'
  gem 'pry-byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'rack-cors'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# load static assets for heroku
gem 'rails_12factor', group: :production

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'ffaker'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'vcr'
  gem 'webmock'
end
