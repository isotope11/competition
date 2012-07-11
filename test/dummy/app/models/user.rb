class User < ActiveRecord::Base
  include Competition
  attr_accessible :id

  has_score
end
