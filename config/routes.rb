# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboard/', to: 'dashboard#index', as: 'dashboard'
  resources :leads do
    resources :phases, shallow: true
  end
  # root to: 'dashboard#login'
  root to: redirect('/users/sign_in')
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
