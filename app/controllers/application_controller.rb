class ApplicationController < ActionController::Base
  include Authentication
  allow_browser versions: :modern

  stale_when_importmap_changes
end
