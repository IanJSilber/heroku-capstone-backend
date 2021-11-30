class PositionsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  def index
    positions = Position.find_by(user_id: current_user.id)

    render json: positions
  end

  def create
    position = Position.new(
      user_id: current_user.id,
      asset: params[:asset],
      amount: params[:amount],
    )
    if position.save
      render json: position
    else
      render json: { errors: position.errors.full_messages }, status: :bad_request
    end
  end
end
