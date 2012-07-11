class Test < ActiveRecord::Base
  # attr_accessible :title, :body
  #
  keeps_score :if => { true },
              :on => [:create],
              :amount => { 1 },
              :with => {|o| o.user }
end
