Rails.application.routes.draw do
  resources :users do 
    resources :diys
  end
  resources :materials
  resources :diys do 
    resources :materials
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
