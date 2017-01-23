source 'https://rubygems.org'
ruby '2.2.1'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg',      '0.17.1'
gem 'unicorn', '4.8.2'
gem 'foreman', '0.63.0'

gem 'bluecloth',                 '2.2.0'
gem 'validates_timeliness',      '~> 3.0'
gem "d3-rails", "3.5.5"
gem 'twitter-typeahead-rails',   '0.9.3'
gem 'bootstrap-typeahead-rails', '0.9.3.3'

gem 'paperclip',      '~> 3.0'
gem 'aws-sdk',        '1.33.0'

gem 'devise',         '3.2.2'
gem 'syck'
gem 'rails_admin',    '0.4.9'
gem 'cancan',         '1.6.10'

gem 'textacular',     '3.2.0'
  
gem 'roo',            '1.13.2'


group :development do
  gem 'capistrano',      '~> 2.0'
  gem 'net-ssh',         '2.7.0'
  gem 'net-ssh-gateway', '1.2.0'
  gem 'capistrano-unicorn', :require => false
end


group :development, :test do
  gem 'progress_bar'

  gem 'rspec-rails'
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails'
  gem 'launchy'
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
end

group :production do
  gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', '0.12.1', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '3.1.0'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# To use debugger
# gem 'debugger'
