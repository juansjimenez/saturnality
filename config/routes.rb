# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin/show'
  get 'myinterested/show'
  get 'myparties/show'
  get 'users/index'
  Rails.application.routes.draw do
    get 'admin/show'
    get 'myinterested/show'
    get 'myparties/show'
    get 'users/index'
    devise_for :users, controllers: {
      sessions: 'users/sessions', registrations: 'users/registrations'
    }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  root to: 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/about_parties'
  get 'static_pages/about_services'
  get 'static_pages/about_us'

  resources :comunas
  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'
  get '/myparties/show' => 'myparties#show', as: :mypartiesshow
  get '/myinterested/show' => 'myinterested#show', as: :myinterestedshow
  get '/myattendance/show' => 'myattendance#show', as: :myattendanceshow
  get '/myaservices/show' => 'myaservices#show', as: :myaservicesshow
  get '/mypservices/show' => 'mypservices#show', as: :mypservicesshow

  get '/admin/show' => 'admin#show', as: :admin
  resources :services do
    resources :servicereviews
    resources :contracts
  end

  resources :parties do
    post :close_and_notify, on: :member
    resources :partyreviews
    resources :interesteds
    resources :services do
      resources :servicereviews
    end
  end

  resources :attendees do
    post :accept_invitation, on: :member
    post :reject_invitation, on: :member
  end

  resources :contracts

  resources :interesteds
end
