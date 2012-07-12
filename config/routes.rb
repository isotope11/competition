Competition::Engine.routes.draw do
  resources :leaderboard, :only => [:index]
end
