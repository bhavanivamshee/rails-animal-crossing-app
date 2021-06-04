Rails.application.routes.draw do
  resources :users, except: [:new] do 
    resources :diys
  end
  resources :materials
  resources :diys do 
    resources :materials
  end

  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
