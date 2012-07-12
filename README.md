### Competition

On the model you want to keep score of, usually your User model, put this code:

    has_score

On the model that awards score put this code:

    keeps_score :if => Proc.new { true },
                :on => [:create],
                :amount => Proc.new { |tc| 1 },
                :for => Proc.new {|o| o.user }

then goto /competition/leaderboard and viola!
