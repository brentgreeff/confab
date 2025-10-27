require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"

abort("The Rails env is running in production mode!") if Rails.env.production?
return unless Rails.env.test?

require "rspec/rails"
# Add additional requires below this line. Rails is not loaded until this point!

Dir[
  Rails.root.join("spec", "support", "**", "*.rb")
].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.fixture_paths = [ Rails.root.join("spec/fixtures") ]

  config.include SysHelpers, type: :system
  config.include TimecopHelpers

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  # config.filter_gems_from_backtrace("gem name")
end
