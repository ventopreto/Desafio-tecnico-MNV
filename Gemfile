# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.6"

gem "bootsnap", ">= 1.4.4", require: false
gem "i18n", "~> 1.14.6"
gem "jbuilder", "~> 2.7"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.7", ">= 6.1.7.10"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "rspec-rails", "~> 4.1.2"
  gem "ruby-lsp"
  gem "standard"
  gem "standard-rails"
end

group :test do
  gem "capybara"
  gem "shoulda-matchers", "~> 6.0"
  gem "simplecov", require: false
end

group :development do
  gem "rails_best_practices"
  gem "erb_lint", require: false
  gem "i18n-tasks", "~> 1.0.14", group: :development
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
