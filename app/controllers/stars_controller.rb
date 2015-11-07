class StarsController < ApplicationController

  def create
    deck = Deck.find(params[:id])
    star = deck.stars.new(user_id: current_user.id)
    if star.save
      render json: { success: "Deck starred successfully" }, status: :ok
    else
      render json: { errors: star.errors.full_message }, status: :unprocessable_entity
    end
  end

  def index
    deck = Deck.find(params[:id])
    binding.pry
  end
end