class DecksController < ApplicationController
  before_action :authenticate_user!

  def create
    @deck = current_user.decks.new(title: params["title"])
    if @deck.save
      render "new.json.jbuilder", status: :created
    else
      render json: { errors: @deck.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def index
    if params["owner"] == "mine"
      @decks = current_user.decks
      render "index.json.jbuilder", status: :ok
    elsif params["owner"] == "all"
      @decks = Deck.all
      render "index.json.jbuilder", status: :ok
    else
      render json: { errors: "Please specify whether you want 'all' decks or just 'mine'!"}, status: :unprocessable_entity
    end
  end

  def destroy
    deck = current_user.decks.find(params["id"])
    if deck
      deck.destroy
      render json: { success: "Deck deleted successfully" }, status: :ok
    else
      render json: { errors: "That deck doesn't belong to you!" }, status: :unauthorized
    end
  end

  def update
    deck = current_user.decks.find(params["id"])
    if deck
      if params["title"].nil?
        render json: { error: "Title cannot be blank!"}, status: :unprocessable_entity
      else
        deck.update(title: params["title"])
        render json: { success: "Deck updated successfully"}, status: :ok
      end
    else
      render json: { errors: "That deck doesn't belong to you!" }, status: :unauthorized
    end
  end

end