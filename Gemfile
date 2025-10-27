source "https://rubygems.org"

gem "rails", "~> 8.1.0"
gem "puma", ">= 5.0"
gem "pg", "~> 1.1"

gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

gem "jbuilder"

# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false

gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  gem "bundler-audit", require: false

  # Static analysis for security vulnerabilities [https://  gem "brakeman", require: false

  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
