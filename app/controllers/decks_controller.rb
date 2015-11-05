class DecksController < ApplicationController
  before_action :authenticate_user!

  def new
    @deck = current_user.decks.new(title: params["title"])
    if @deck.save
      render "new.json.jbuilder", status: :created
    else
      render json: { errors: @deck.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def index
    render "index.json.jbuilder", status: :ok unless params["user_id"]

    user = User.find(id: params["user_id"])
    if user && (user.id == current_user.id)
      @decks = user.decks
    else
      @decks = Deck.all
    end

  end

end