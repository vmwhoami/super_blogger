# frozen_string_literal: true

Rails.application.routes.draw do
  root 'articles#home'
  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
