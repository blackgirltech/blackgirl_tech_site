Rails.application.routes.draw do

  devise_for :members, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations"}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/about' => "static_pages#about"
  get '/code' => "static_pages#code_of_conduct"
  get '/press' => "static_pages#press"
  get '/terms' => "static_pages#terms"
  get '/privacy_policy' => "static_pages#privacy_policy"
  get '/fundraising' => "static_pages#fundraising"
  get '/past_donors' => "static_pages#past_donors"

  resources :events
  resources :opportunities do
    resources :applications, shallow: true
  end
  patch 'events/:id/rsvp' => 'events#rsvp', as: :rsvp
  get 'events/:id/unrsvp' => 'events#unrsvp', as: :unrsvp
  patch 'events/:id/volunteer' => 'events#volunteering', as: :volunteer
  get 'events/:id/unvolunteer' => 'events#unvolunteering', as: :unvolunteer
  get 'events/:id/thanks' => 'events#thanks', as: :event_thanks
  resources :members, only: [:show, :edit, :update]
  # authenticate :member do
    resources :donations do
      get 'complete', on: :member
      get 'cancel'
    # end
  end
  get 'thank_you' => 'donations#thank_you'
  resources :members do
    patch 'unsubscribe' => 'members#unsubscribe', as: :unsubscribe
    get 'unsubscribe' => 'members#show_unsubscribe', as: :show_unsubscribe
  end
  namespace :admin do
    get '/dashboard' => 'admin#dashboard'
    resources :opportunities, except: [:index, :show]
    resources :events, except: [:index, :show] do
      resources :rsvps
      post 'rsvps/:id/check_in' => 'rsvps#check_in', as: :check_in
      post 'rsvps/:id/check_out' => 'rsvps#check_out', as: :check_out
    end
    resources :opportunities do
      resources :applications, only: [:index, :show, :edit, :update], shallow: true
    end
    post 'applications/:id/send_awarded_email' => 'applications#awarded_email', as: :send_awarded_email
  end
  # resources :donations, only: [:new, :create]
end
