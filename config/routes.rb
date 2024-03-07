Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users

  root to: "pages#home" # main page

  get "users", to: "users#show"

  get "users/lists", to: "users#list_users"

  # routes for api
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
    end
  end

end
