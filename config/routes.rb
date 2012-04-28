PitchAndGo::Application.routes.draw do
  resources :pitches
  resources :users

  match "/auth/google/callback", :to => 'omniauth#callback'

  root :to => 'site#index'
end
