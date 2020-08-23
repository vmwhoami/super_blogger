Rails.application.routes.draw do
  root 'mains#index'

  resources :articles
end
