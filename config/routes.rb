Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/positions" => "positions#index"
  post "/positions" => "positions#create"
end
