Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :members, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#about'
  get '/about' => "static_pages#about"
  get '/code' => "static_pages#code_of_conduct"
  get '/press' => "static_pages#press"
  get '/terms' => "static_pages#terms"
  get '/privacy_policy' => "static_pages#privacy_policy"

  resources :events
  resources :members, only: [:show]
  authenticate :member do 
    resources :memberships, only: [:create, :edit, :update] do
      get 'complete', on: :member
      get 'cancel'
    end
  end
  resources :members do
    resources :memberships, only: [:edit, :update]
  end
  resources :memberships, only: [:new]

end