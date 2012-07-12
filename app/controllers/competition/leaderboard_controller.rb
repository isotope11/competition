require_dependency "competition/application_controller"

module Competition
  class LeaderboardController < ApplicationController
    def index
      #TODO: Make this not suck
      @scores = Competition::Score.all.sort {|a, b| b.score_entries.sum(:amount) <=> a.score_entries.sum(:amount)}
    end
  end
end
