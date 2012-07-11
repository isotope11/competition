require "competition/engine"

module Competition
  extend ActiveSupport::Concern
  included do
  end

  module ClassMethods
    def has_score
      self.class.class_eval {
        has_many :scores, :as => :scoreable
      }
    end

    def keeps_score options={}
      options[:on].each do |event|
        case event
        when :create
          self.class.class_eval {
            after_create :add_score
          }
        when :update
          self.class.class_eval {
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

  module InstanceMethods
    def add_score
      return unless @@score_if.call(self)
      score = Competition::Score.find_or_create_by(:scoreable_type => score_with.class.to_s, :scoreable_id => score_with.id)
      Competition::ScoreEntry.create(:score => score_amount, :score => score )
    end

    def score_amount
      @score_amount = self.class.score_amount.call(self)
    end

    def score?
      @score_if = self.class.score_if.call(self)
    end

    def score_with
      @score_with = self.class.score_with.call(self)
    end
  end
end
