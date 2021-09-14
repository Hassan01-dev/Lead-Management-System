# frozen_string_literal: true

Rails.application.routes.draw do
  get '/dashboard', to: 'leads#index', as: 'dashboard'
  resources :leads do
    resources :phases, shallow: true do
      resources :comments, shallow: true
    end
  end
  # root to: 'dashboard#login'
  root to: redirect('/users/sign_in')
  devise_for :users

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
