class CardsController < ApplicationController
  before_action :authenticate_user!

  def new
    @card = Card.new
    render :new
  end

  def create
    card = Card.create(front: params[:front], back: params[:back] deck_id: params[:deck_id], user_id: params[:user_id])
    #redirect_to cards_path(card.link_id)
  end

  def edit
    card = Card.find(params[:id])
    render :edit
  end

  def update
    card = Card.find(params[:id])
    card.update(front:, back: params[:front],[:back] )
    redirect_to cards_path(card.link_id)
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy
    redirect_to cards_path
  end
end