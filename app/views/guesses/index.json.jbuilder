json.stats do
  json.guess_count @guessdata[:count]
  json.avg_duration @guessdata[:duration]
  json.correct_count @guessdata[:correct]
  json.incorrect_count @guessdata[:incorrect]
  json.fastest_duration @guessdata[:fastest]
  json.fastest_user @guessdata[:user]
#  @guessdata[:fastest] = guesses.order(duration: :desc).first[:duration]

end