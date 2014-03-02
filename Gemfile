source "https://rubygems.org"

gem "rails", "4.0.2"
gem "pg"
gem "sass-rails", "~> 4.0.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.0.0"
gem "jquery-rails"
gem "jbuilder", "~> 1.2"
gem "capybara"
gem "capybara-webkit"
gem "money-rails"
gem "active_attr"
gem "chronic"
gem "kaminari"
gem "chartkick"
gem "groupdate"
gem "sidekiq"
gem "sinatra"

group :development do
  gem "pry"
  gem "capistrano", "~> 3.1.0"
  gem "capistrano-bundler", "~> 1.1.1"
  gem "capistrano-rbenv", "~> 2.0.2"
  gem "capistrano-rails", "~> 1.1.1"
  gem "capistrano-unicorn", github: "patbenatar/capistrano-unicorn"
end

group :staging, :production do
  gem "unicorn-rails", "~> 1.1.0"
end
