source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem 'bcrypt', '~> 3.1.7'
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "interactor", "~> 3.0"
gem "jbuilder"
gem "jsbundling-rails"
gem 'jwt'
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "redis", "~> 4.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)

group :development, :test do
  gem 'annotate'
  gem "debug", platforms: %i(mri mingw x64_mingw)
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'rubocop-airbnb'
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
