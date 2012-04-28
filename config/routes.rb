PitchAndGo::Application.routes.draw do
  resources :pitches do
    member do
      post :vote
    end
  end
  resources :users

  match "/auth/google/callback", :to => 'omniauth#callback'
  match "/logout", :to => 'site#logout'

  root :to => 'site#index'
end
