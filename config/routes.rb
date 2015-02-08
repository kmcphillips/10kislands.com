Rails.application.routes.draw do
  root "page#home"

  get "index" => "page#home"

  devise_for :users

  namespace :admin do
    root "users#index"

    resources :users
  end
end
