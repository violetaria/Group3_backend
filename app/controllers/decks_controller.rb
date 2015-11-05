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

end