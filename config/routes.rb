Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#about'
  get '/about' => "static_pages#about"
  get '/code' => "static_pages#code_of_conduct"
  get '/donate' => "static_pages#donate"

  resources :events
end
