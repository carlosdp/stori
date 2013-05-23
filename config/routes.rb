Stori::Application.routes.draw do
  resources :stories do
    resources :sentences, only: [:index, :new, :create], on: :member
    get 'compose', on: :member, as: 'compose'
    get 'continue_composing', on: :member, as: 'continue_composing'
    get 'record', on: :member, as: 'record'
    get 'join', on: :member, as: 'join'
    get 'leave', on: :member, as: 'leave'
  end
  resources :sentences, except: [:index, :new, :create]
  resources :authors

  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#logout', as: 'logout'
  post 'login' => 'sessions#login'

  get 'signup' => 'authors#new'

  root to: 'stories#index'
end
