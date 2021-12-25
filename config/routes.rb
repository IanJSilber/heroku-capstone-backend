Rails.application.routes.draw do

  get "/" => "home#hello"
  #User and Sessions routes

  get "/users" => "users#index"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  #News route

  get "/news" => "news#index"

  #Top coins route

  get "/top-coins" => "top_coins#index"

  #positions routes

  get "/positions" => "positions#index"
  get "/positions/:id" => "positions#show"
  post "/positions" => "positions#create"
  patch "/positions/:id" => "positions#update"
  delete "/positions/:id" => "positions#destroy"

  #watchlists routes

  get "/watchlists" => "watchlists#index"
  get "/watchlists/:id" => "watchlists#show"
  post "/watchlists" => "watchlists#create"
  patch "/watchlists/:id" => "watchlists#update"
  delete "/watchlists/:id" => "watchlists#destroy"

  #assets routes

  get "/assets/:watchlist_id" => "assets#index"
  post "/assets" => "assets#create"
  patch "/assets/:id" => "assets#update"
  delete "/assets/:id" => "assets#destroy"
  
end
#this is a github test
