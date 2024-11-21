class StatsController < ApplicationController
  def index
    @users = UserStats.changes
  end
end
