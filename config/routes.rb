Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#about'
  get '/about' => "static_pages#about"
  get '/code' => "static_pages#code_of_conduct"

  resources :events
  resources :users, only: [:show]
  authenticate :user do 
    resources :subscriptions, only: [:create, :edit, :update] do
      get 'complete', on: :member
    end
  end
  resources :users do
    resources :subscriptions, only: [:edit, :update]
  end
  resources :subscriptions, only: [:new]
end