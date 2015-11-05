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
    params[:decks]  # all

    if params[:decks].nil?
      @decks = current_user.decks
    elsif params[:decks] == "all"
    else
      render

    end
    @decks = Deck.all
    render "index.json.jbuilder", status: :ok unless params["user_id"]

    user = User.find(params["user_id"])

    render json: { errors: "User not found!"}, status: :not_found unless user

    if user && (user.id == current_user.id)
      @decks = user.decks
    else
      @decks = Deck.all
    end

  end

end