Rails.application.routes.draw do
  root "page#home"

  get "index" => "page#home"

  devise_for :users

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

  namespace :admin do
    root "cards#index"

    resources :cards, only: [:index, :edit, :update] do
      member do
        post :move_higher
        post :move_lower
      end
    end
    resources :users, except: [:show]
  end
end
