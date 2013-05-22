Stori::Application.routes.draw do
  resources :stories do
    resources :sentences, only: [:index], on: :member
  end
  resources :sentences, except: [:index]
  resources :authors

  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#logout', as: 'logout'
  post 'login' => 'sessions#login'

  get 'signup' => 'authors#new'

  root to: 'stories#index'
end
