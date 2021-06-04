Rails.application.routes.draw do
  resources :users do 
    resources :diys
  end
  resources :materials do
    resources :diys
  end

  resources :diys do 
    resources :materials
    resources :users
  end

  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/facebook/callback", to: "sessions#create_with_facebook"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
