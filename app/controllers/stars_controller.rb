class StarsController < ApplicationController

  def create
    deck = Deck.find(params[:id])
    star = deck.stars.new(user_id: current_user.id)
    if star.save
      render "create.json.jbuilder", status: :ok
    else
      render json: { error: star.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    deck = Deck.find(params[:id])
    binding.pry
  end
end