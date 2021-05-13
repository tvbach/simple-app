Rails.application.routes.draw do
  resources :users

  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"

  root "static_pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
