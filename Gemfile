source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.4"

gem "rails", "~> 6.1.7", ">= 6.1.7.10"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "i18n", "~> 1.14.6"
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "standard"
  gem "standard-rails"
  gem "pry-byebug"
  gem "rspec-rails", "~> 4.1.2"
  gem "ruby-lsp"
end

group :test do
  gem "shoulda-matchers", "~> 6.0"
  gem "simplecov", require: false
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  gem "spring"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
