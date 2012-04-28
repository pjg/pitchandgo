PitchAndGo::Application.routes.draw do
  resources :pitches
  resources :users

  root :to => 'site#index'
end
