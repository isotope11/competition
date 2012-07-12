class User < ActiveRecord::Base
  include Competition
  attr_accessible :id

  has_score

  def to_s
    "Adam Gamble"
  end
end
