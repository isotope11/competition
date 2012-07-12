module Competition
  class Score < ActiveRecord::Base
    attr_accessible :scoreable_id, :scoreable_type
    belongs_to :scoreable, :polymorphic => true
    has_many :score_entries

    def total
      score_entries.sum(:amount)
    end
  end
end
