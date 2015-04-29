Rails.application.routes.draw do
  root "list#index"
  resources :list
end
