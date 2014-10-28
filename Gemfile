source 'https://rubygems.org'


gem 'rails', '4.1.6' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'pg' # Use postgres as the database for Active Record

gem 'rails_12factor' # Use rails_12factor to enable all functionality with heroku

gem 'sass-rails', '~> 4.0.3' # Use SCSS for stylesheets

gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets

gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views

gem 'devise' # Take care of user authentication with devise

gem "paperclip", "~> 4.2" # Allow the user to upload photos and files with paperclip

gem 'jquery-turbolinks' #Make jquery play nice with turbolinks

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.0', group: :doc # bundle exec rake doc:rails generates the API under doc/api.

gem 'figaro' #keep your secrets in environment variables

gem 'spring',        group: :development # Spring speeds up development by keeping your application running in the background.

group :development, :test do
  gem 'guard'
  gem "rspec-rails", '~> 2.14.0.rc1'
  gem 'factory_girl_rails'  #use factories for test, not fixtures
end

group :test do
  gem 'capybara'            #intuitive testing language
  gem 'selenium-webdriver'  #allows js in tests
  gem 'spork', :github => 'sporkrb/spork'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
  gem "guard-spork"         #automatic tests on file save
  gem "guard-rspec"         #ditto
  gem 'database_cleaner'    #clean the database in tests easily
  gem 'launchy'             #for opening up the page while debugging tests

  # Uncomment this line on OS X.
  # gem 'growl', '1.0.3'

  # Uncomment these lines on Linux.
  # gem 'libnotify', '0.8.0'

  # Uncomment these lines on Windows.
  # gem 'rb-notifu', '0.0.4'
  # gem 'wdm', '0.1.0'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
