Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/positions" => "positions#index"
  get "/positions/:id" => "positions#show"
  post "/positions" => "positions#create"
  patch "/positions/:id" => "positions#update"
  delete "/positions/:id" => "positions#destroy"
end
#this is a github test
