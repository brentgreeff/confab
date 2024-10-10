class ApplicationController < ActionController::Base
  # Only browsers: webp img, web push, badges, import maps, CSS nesting, & :has.
  allow_browser versions: :modern

  before_action :load_current_project

  private def load_current_project
    @project = Project.first

    raise Exception.new, "Please run `rails db:seed`" if @project.nil?
    # this is temporary, while we only have the `current_project`.
  end
end
