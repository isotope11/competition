require "competition/engine"
require 'active_support/concern'

module Competition
  extend ActiveSupport::Concern

  module ClassMethods
    @@score_with    = nil
    @@score_if      = nil
    @@score_amount  = nil
    def has_score
      self.class_eval {
        has_one :score, :as => :scoreable, :class_name => "Competition::Score"
      }
    end

    def keeps_score options={}
      self.class_eval {
        has_many :score_entries, :as => :score_entryable, :class_name => "Competition::ScoreEntry"
      }

      options[:on].each do |event|
        case event
        when :create
          self.class_eval {
            after_create :add_score
          }
        when :update
          self.class_eval {
            after_save :add_score
          }
        end
      end
      @@score_with    = options[:for]
      @@score_if      = options[:if]
      @@score_amount  = options[:amount]
    end

    def score_with
      @@score_with
    end

    def score_if
      @@score_if
    end

    def score_amount
      @@score_amount
    end
  end

  def add_score
    return unless score?
    score = Competition::Score.find_or_create_by_scoreable_type_and_scoreable_id(score_with.class.to_s, score_with.id)
    Competition::ScoreEntry.create(:amount => score_amount, :score_id => score.id, :score_entryable_type => self.class.to_s, :score_entryable_id => self.id )
  end

  def score_amount
    @score_amount ||= self.class.score_amount.call(self)
  end

  def score?
    @score_if ||= self.class.score_if.call(self)
  end

  def score_with
    @score_with ||= self.class.score_with.call(self)
  end
end
