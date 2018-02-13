# frozen_string_literal: true

Rails.application.routes.draw do
  resources :machine_statuses
  resources :statuses
  get 'dashboard/index'

  resources :machines

  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
