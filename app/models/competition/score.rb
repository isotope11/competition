module Competition
  class Score < ActiveRecord::Base
    attr_accessible :scoreable_id, :scoreable_type
    belongs_to :scoreable, :polymorphic => true
    has_many :score_entries
  end
end
