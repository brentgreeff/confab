RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus

  config.example_status_persistence_file_path = "spec/examples.txt"

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = "doc"
  else
    require "simplecov"

    SimpleCov.start do
      track_files "{app,lib}/**/*.rb"
      enable_coverage :branch
      add_group "Controllers", "app/controllers"
      add_group "Jobs", "app/jobs"
      add_group "Mailers", "app/mailers"
      add_group "Helpers", "app/helpers"
      add_group "Models", "app/models"
      add_group "Channels", "app/channels"
      add_group "App", "app"
      add_group "Config", "config"
      add_filter "/spec/"
    end
  end

  # config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end
