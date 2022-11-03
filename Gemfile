source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby IO.read(".ruby-version").strip

gem "auto_strip_attributes", "~> 2.6"
gem "bcrypt",                "~> 3.1"
gem "bootstrap-sass",        "~> 3.4.1"
gem "caxlsx",                "~> 3.3.0"
gem "caxlsx_rails",          "~> 0.6.2"
gem "font-awesome-rails",    "~> 4.7"
gem "jbuilder",              "~> 2.5"
gem "jquery-rails",          "~> 4.3"
gem "mysql2",                ">= 0.4.4", "< 0.6.0"
gem "puma",                  ">= 3.11"
gem "rack-cors",             "~> 1.1.1"
gem "rails",                 "~> 7.0.4"
gem "rails-i18n",            "~> 7.0.5"
gem "sass-rails",            ">= 6"
gem "simple_form",           "~> 5.0.2"
gem "slim",                  "~> 4.0"
gem "turbolinks",            "~> 5"
gem "uglifier",              ">= 4.1.0"
gem "virtus",                "~> 1.0.5"

gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "pry-byebug", ">= 3.6", platform: :mri
  gem "pry-rails",  ">= 0.3", platform: :mri
end

group :development do
  gem "capistrano",           "~> 3.11"
  gem "capistrano-bundler",   "~> 2.1"
  gem "capistrano-passenger", "~> 0.2"
  gem "capistrano-rails",     "~> 1.6"
  gem "capistrano-rvm",       "~> 0.1"
  gem "web-console",          ">= 3.3.0"
  gem "listen",               ">= 3.7"
end
