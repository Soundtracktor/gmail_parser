# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'dotenv-rails'
gem 'nokogiri'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.1'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'redis'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'turbolinks', '~> 5'
gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'
gem 'watir'
gem 'capybara', '~> 2.13'
gem 'selenium-webdriver'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'chromedriver-helper'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
