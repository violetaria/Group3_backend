class GuessesController < ApplicationController

  def create
    guess = current_user.guesses.new(card_id: params["id"],
                                      duration: params["duration"].to_i,
                                      correct: to_bool!(params["correct"]))
    if guess.save
      render json: { success: "Guess saved"}, status: :created
    else
      render json: { errors: guess.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    card = Card.find(params["id"])
    if params["owner"] == "mine"
      guesses = card.current_user.guesses
      @guessdata = Hash.new
      @guessdata[:count] = guesses.count
      @guessdata[:duration] = guesses.average(:duration)
      @guessdata[:correct] = guesses.where(correct: true).count
      @guessdata[:incorrect] = guesses.where(correct: false).count
      @guessdata[:fastest] = guesses.order(duration: :desc).first[:duration]
      @guessdata[:user] = guesses.order(duration: :desc).first.user[:username]
      render "index.json.jbuilder", status: :ok
    elsif params["owner"] == "all"
      guesses = card.guesses
      @guessdata = Hash.new
      @guessdata[:count] = guesses.count
      @guessdata[:duration] = guesses.average(:duration)
      @guessdata[:correct] = guesses.where(correct: true).count
      @guessdata[:incorrect] = guesses.where(correct: false).count
      @guessdata[:fastest] = guesses.order(duration: :desc).first[:duration]
      @guessdata[:user] = guesses.order(duration: :desc).first.user[:username]
      render "index.json.jbuilder", status: :ok
    else
      render json: { errors: "Please specify whether you want 'all' guesses or just 'mine' for this card!"}, status: :unprocessable_entity
    end
  end

  private
  def to_bool!(value)
    ActiveRecord::ConnectionAdapters::Column::TRUE_VALUES.include?(value)
  end

end