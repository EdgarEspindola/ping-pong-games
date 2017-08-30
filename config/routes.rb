Rails.application.routes.draw do
  resources :rankings
  resources :games do
    get 'history' => "games#history", on: :collection
  end
  
  devise_for :users
  root to: "home#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'
end
