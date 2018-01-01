Rails.application.routes.draw do
  devise_for :members, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
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
  # authenticate :member do
    resources :donations do
      get 'complete', on: :member
      get 'cancel'
    # end
  end
  resources :members
  # resources :donations, only: [:new, :create]
end
