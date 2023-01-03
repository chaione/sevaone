source 'https://rubygems.org'

ruby "2.6.6"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.4.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'google-api-client', '~> 0.11'
gem 'sucker_punch'
gem 'activejob-traffic_control'
gem 'dotenv-rails'
gem 'rack-cors', :require => 'rack/cors'
gem 'geocoder'
gem 'devise'
gem 'vacuum'
gem 'connection_pool'
gem "httparty", "~> 0.21.0"
gem 'redis', '~> 3.2'
gem 'simple_form'
gem 'redcarpet'
gem 'sentry-raven'
gem 'scout_apm'
gem 'bootsnap', require: false

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry'
  gem 'vcr'
  gem "webmock", "~> 3.0"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
