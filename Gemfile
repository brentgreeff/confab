source "https://rubygems.org"

gem "rails", "~> 8.1.0"
gem "puma", ">= 5.0"
gem "pg", "~> 1.1"

gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 4.3"
gem "slim"

gem "jbuilder"

gem "bcrypt", "~> 3.1.7"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false

gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "bundler-audit", require: false
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
  gem "guard-livereload", require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "timecop"
  gem "simplecov", require: false
end
