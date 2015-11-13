class CardsController < ApplicationController
  before_action :authenticate_user!



  def create
    @card = current_user.decks.find(params[:id]).cards.new(front: params[:front], back: params[:back])
    #binding.pry
    if @card.save
      render 'create.json.jbuilder', status: :created 
      else render json: {errors: @card.errors.full_messages},
        status: :unproccessable_entity
      end  
  end  
    
  def index
    #binding.pry
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
    render "index.json.jbuilder", status: :ok
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy
    render "destroy.json.jbuilder", status: :ok
  end

  def edit
    @card =Card.find(params[:id])
    @card.update(front: params[:front], back: params[:back])
    render "edit.json.jbuilder", status: :ok
  end


    # render json: { id: card.id, front: card.front, back: card.back, deck_id: card.deck_id}
    #redirect_to cards_path(card.link_id)
  end

  # def edit
  #   card = Card.find(params[:id])
  #   render :edit
  # end

  # def update
  #   card = Card.find(params[:id])
  #   #card.update(front:, back: params[:front],[:back] )
  #   redirect_to cards_path(card.link_id)
  # end

  # def destroy
  #   card = Card.find(params[:id])
  #   card.destroy
  #   redirect_to cards_path
  # end