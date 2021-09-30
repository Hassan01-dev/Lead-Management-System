# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects, only: %i[index new create]
  resources :leads do
    get '/approve', to: 'leads#approve', as: 'approve'
    resources :phases, shallow: true do
      get '/new_engineer', to: 'phases#new_engineer', as: 'new_engineer'
      patch '/add_engineer_to_phase', to: 'phases#add_engineer_to_phase', as: 'add_engineer_to_phase'
      patch '/remove_engineer_from_phase', to: 'phases#remove_engineer_from_phase', as: 'remove_engineer_from_phase'
      patch '/approve', to: 'phases#approve', as: 'approve'
      get '/accepted', to: 'phases#accepted', as: 'accepted'
      resources :comments, shallow: true
    end
  end

  patch '/user_activate', to: 'users#activate', as: 'activate_account'
  patch '/user_disabled', to: 'users#disabled', as: 'disable_account'
  post '/comments/:id/delete_image/', to: 'comments#delete_image', as: 'delete_image'
  get '/users/:id/change_password', to: 'users#password_change', as: 'password_change'
  patch '/password_update/:id', to: 'users#password_update', as: 'password_update'

  root to: redirect('/users/sign_in')
  devise_for :users, controllers: { sessions: 'user/sessions' }

  resources :users

  get '*path', to: redirect('/'), code: 404
  # match '*path', to: redirect("#{Rails.root}/public/404"), via: :get, code: 404
  # get '*unmatched_route', to: 'leads#index', code: 404
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
