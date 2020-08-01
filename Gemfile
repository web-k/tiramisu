source 'https://rubygems.org'
ruby '2.6.6'

gem 'rails', '~> 5.2.0'
gem 'sprockets', '~> 3'

gem 'listen'

gem "font-awesome-rails"
gem "bootstrap-sass", '>=2.3.2'
gem 'sassc-rails', '>= 2.1.0'
gem "rails_autolink"
gem 'bootsnap', require: false

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'rake', '< 11.0'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber'
  gem 'cucumber-rails', :require => false
end

group :development do
  gem 'brakeman'
  gem 'rubocop'
end

gem 'pusher'

gem 'webpacker', '>= 4'
gem 'uglifier'

group :production do
  gem 'rails_12factor'
  gem 'pg', '< 1.0.0'
end
