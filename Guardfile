guard :rspec, cmd: "./bin/rspec --format documentation" do
  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  clearing :on

  # RSpec files
  rspec = dsl.rspec
  # watch(rspec.spec_helper) { rspec.spec_dir }
  # watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  # ruby = dsl.ruby
  # dsl.watch_spec_files_for(ruby.lib_files)

  rails = dsl.rails
  dsl.watch_spec_files_for(rails.app_files)

  watch(rails.controllers) do |m|
    [
      rspec.spec.call("requests/#{m[1]}_request")
    ]
  end

  # Rails config changes
  # watch(rails.spec_helper) { rspec.spec_dir }
  watch(rails.app_controller) { "#{rspec.spec_dir}/controllers" }
end
