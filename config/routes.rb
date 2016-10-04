Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/podcast' => "static_pages#podcast"
  get '/who_we_are' => "static_pages#who_we_are"
  get '/what_we_do' => "static_pages#what_we_do"
  get '/get_involved' => "static_pages#get_involved"

  resources :events
end
