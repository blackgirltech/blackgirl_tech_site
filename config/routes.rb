Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/about' => "static_pages#about"
  get '/code_of_conduct' => "static_pages#code_of_conduct"

  resources :events
end
