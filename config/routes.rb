Rails.application.routes.draw do
  root "page#home"

  get "index" => "page#home"
end
