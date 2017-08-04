Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  devise_for :members, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#about'
  get '/about' => "static_pages#about"
  get '/code' => "static_pages#code_of_conduct"
  get '/press' => "static_pages#press"
  get '/terms' => "static_pages#terms"
  get '/privacy_policy' => "static_pages#privacy_policy"

  resources :events
  patch 'events/:id/rsvp' => 'events#rsvp'
  get 'events/:id/unrsvp' => 'events#unrsvp'
  get 'events/:id/volunteer' => 'events#volunteering'
  get 'events/:id/unvolunteer' => 'events#unvolunteering'
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
  get '/memberships/club_membership' => 'memberships#club_membership'
  post '/memberships/club_membership' => 'memberships#create_club_membership'
  get '/memberships/base_membership' => 'memberships#base_membership'
  post '/memberships/base_membership' => 'memberships#create_base_membership'
  get '/memberships/ally_membership' => 'memberships#ally_membership'
  post '/memberships/ally_membership' => 'memberships#create_ally_membership'
  resources :donations, only: [:new, :create]

  namespace :forest do
    post '/actions/check-in' => 'rsvps#check_in'
  end
end
