# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboard/index', as: 'dashboard'
  # root to: 'dashboard#login'
  root to: redirect('/users/sign_in')
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
