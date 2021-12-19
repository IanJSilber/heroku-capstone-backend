class WatchlistsController < ApplicationController

  before_action :authenticate_user

  def index
    watchlists = current_user.watchlists
    render json: watchlists
  end

  def show
    watchlist = Watchlist.find_by(user_id: current_user.id, id: params[:id])
    render json: watchlist
  end

  def create
    watchlist = Watchlist.new(
      user_id: current_user.id,
      name: params[:name]
    )
    if watchlist.save
      render json: watchlist
    else
      render json: {errors: watchlist.errors.full_messages}, status: :unproccessable_entity
    end
  end

  def update
    watchlist = Watchlist.find_by(user_id: current_user.id, id: params[:id])
    watchlist.name = params[:name] || watchlist.name
    if watchlist.save
      render json: watchlist
    else
      render json: {errors: watchlist.errors.full_messages}, status: :unproccessable_entity
    end
  end

  def destroy
    watchlist = Watchlist.find_by(user_id: current_user.id, id: params[:id])
    watchlist.destroy
    render json: { message: "watchlist destroyed" }
  end
end
