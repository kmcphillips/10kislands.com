Rails.application.routes.draw do
  root "page#home"

  get "index" => "page#home"

  devise_for :users

  namespace :admin do
    resources :users
  end
end
