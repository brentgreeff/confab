source "https://rubygems.org"

ruby "3.3.5"

gem "rails", "~> 8.0.0.beta1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"

gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "slim"

# https://guides.rubyonrails.org/active_model_basics.html#securepassword
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cache"
gem "solid_queue"

gem "bootsnap", require: false
gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false

  gem "rubocop-rails-omakase", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-factory_bot", require: false

  gem "rspec-rails"
  gem "guard-rspec", require: false
  gem "factory_bot_rails"

  gem "pry-rails"
  gem "pry-doc"
  gem "ostruct" # should be required by pry.
end

group :development do
  # gem "web-console"
  gem "lefthook"
end

group :test do
  # https://guides.rubyonrails.org/testing.html#system-testing
  gem "capybara"
  gem "selenium-webdriver"
  gem "timecop"
  gem "simplecov", require: false
end
