# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'active_model_serializers', '~> 0.10.10'
gem 'bootsnap', '~> 1.5.1', require: false
gem 'dotenv-rails', '~> 2.7.6'
gem 'jwt', '~> 2.2.2'
gem 'omniauth', '~> 1.9.1'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 5.0.4'
gem 'rack-cors', '~> 1.1.1'
gem 'rails', '~> 6.0.3.4'
gem 'rollbar', '~> 3.1.2'

group :development, :test do
  gem 'pry', '~> 0.13.1'
end

group :development do
  gem 'listen', '~> 3.3.0'
  gem 'rubocop-rails', '~> 2.8.1', require: false
  gem 'rubocop-rspec', '~> 2.0.0', require: false
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
