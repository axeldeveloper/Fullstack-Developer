Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users

  root to: "pages#home" # main page

  get "users", to: "users#show"
end
