module Competition
  class ScoreEntry < ActiveRecord::Base
    attr_accessible :amount, :score_id, :score_entryable_type, :score_entryable_id
    belongs_to :score, :class_name => "Competition::Score"
    belongs_to :score_entryable, :polymorphic => true
  end
end
