guard :livereload do
  watch(%r{app/assets/builds/application.css$})
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.(rb)$})
  watch(%r{app/javascript/controllers/.+\.js$})
end

guard :rspec, cmd: "./bin/rspec --format documentation" do
  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  clearing :on

  watch('app/models/concerns/notifiable.rb') do
    [
      'spec/models/comment_spec.rb',
      'spec/models/change_spec.rb',
    ]
  end

  rspec = dsl.rspec
  watch(rspec.spec_files)

  rails = dsl.rails
  dsl.watch_spec_files_for(rails.app_files)

  watch(rails.controllers) do |m|
    [
      rspec.spec.call("requests/#{m[1]}_request"),
    ]
  end

  # watch(rails.spec_helper) { rspec.spec_dir }
  watch(rails.app_controller) { "#{rspec.spec_dir}/controllers" }
end
