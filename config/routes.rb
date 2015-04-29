Rails.application.routes.draw do

  resources :lists, only: [:index, :show, :create]

  resources :todos, only: [:create]

  root to: 'lists#index'
end
