Rails.application.routes.draw do
  #User and Sessions routes

  get "/users" => "users#index"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  #News route

  get "/news" => "news#index"

  #Top coins route

  get "/top-coins" => "top_coins#index"

  #positions routes
  resources :positions
  # get "/positions" => "positions#index"
  # get "/positions/:id" => "positions#show"
  # post "/positions" => "positions#create"
  # patch "/positions/:id" => "positions#update"
  # delete "/positions/:id" => "positions#destroy"

  #assets routes

  get "/assets" => "assets#index"
  post "/assets" => "assets#create"
  delete "/assets/:id" => "assets#destroy"

end
#this is a github test
