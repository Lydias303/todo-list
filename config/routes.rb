Rails.application.routes.draw do

  resources :lists, only: [:index, :show, :create, :destroy]

  resources :todos, only: [:create, :destroy]

  root to: 'lists#index'
end
