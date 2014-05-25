source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'

gem 'pg'
gem 'mysql2' # for puzzle base

gem 'airbrake'
gem 'acts_as_tree'
gem 'dalli'
gem 'dry_crud'
gem 'kaminari'
gem 'haml'
gem 'rails_config'
gem 'rails-i18n'
gem 'net-ldap'
gem 'seed-fu'
gem 'schema_validations'
gem 'validates_timeliness'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring

group :development, :test do
  gem 'faker'
  gem 'codez-tarantula', require: 'tarantula-rails3', path: '../tarantula'
  gem 'binding_of_caller'
  gem 'pry-rails'
end

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'bullet'
  gem 'quiet_assets'
end

group :test do
  gem 'fabrication'
end

group :console do
  gem 'debugger'
  gem 'pry-doc'
  gem 'pry-nav'
end

group :metrics do
  gem 'annotate'
  gem 'brakeman', '2.5.0'
  gem 'ci_reporter'
  gem 'rails-erd'
  gem 'rubocop'
  gem 'rubocop-checkstyle_formatter'
  gem 'simplecov-rcov'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
