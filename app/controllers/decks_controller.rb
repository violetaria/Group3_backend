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
    #user_id = params["user_id"]
    #if (user_id)
      #@decks =
    #else
      @decks = Deck.all
      render "index.json.jbuilder", status: :ok
    #end
  end

end