class PositionsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  def index
    user_id = current_user.id
    positions = Position.where(user_id: user_id)

    render json: positions
  end

  def show
    position = Position.where(user_id: current_user.id, id: params[:id])
    render json: position
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
      render json: { errors: position.errors.full_messages }, status: :unproccessable_entity
    end
  end

  def update
    position = Position.find_by(id: params[:id])
    if position.user_id == current_user.id
      position.asset = params[:asset] || position.asset
      position.amount = params[:amount] || position.amount
    end
    if position.save
      render json: position
    else
      render json: { errors: position.errors.full_messages }, status: :unproccessable_entity
    end
  end

  def destroy
    position = Position.find_by(id: params[:id])
    if position.user_id == current_user.id
      position.destroy
      render json: {message: "Position successfully destroyed"}
    else
      render json: { errors: position.errors.full_messages }, status: 422
    end
  end

end
