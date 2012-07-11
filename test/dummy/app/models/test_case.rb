class TestCase < ActiveRecord::Base
  include Competition
  attr_accessible :user_id
  belongs_to :user
  keeps_score :if => Proc.new { true },
              :on => [:create],
              :amount => Proc.new { |tc| 1 },
              :for => Proc.new {|o| o.user }
end
