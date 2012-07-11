module Competition
  class ScoreEntry < ActiveRecord::Base
    attr_accessible :score, :score_id
    belongs_to :score
  end
end
