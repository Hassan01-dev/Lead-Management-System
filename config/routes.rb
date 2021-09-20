# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects, only: %i[index new create]
  get '/dashboard', to: 'leads#index', as: 'dashboard'
  resources :leads do
    get '/approve', to: 'leads#approve', as: 'approve'
    resources :phases, shallow: true do
      get '/add_engineer', to: 'phases#add_engineer', as: 'add_engineer'
      get '/approve', to: 'phases#approve', as: 'approve'
      resources :comments, shallow: true
    end
  end

  get '/comments/:id/delete_image/', to: 'comments#delete_image', as: 'delete_image'
  # root to: 'dashboard#login'
  root to: redirect('/dashboard')
  devise_for :users

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
