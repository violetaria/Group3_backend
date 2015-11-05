@decks.each do |deck|
  json.deck do
    json.deck_id deck.id
    json.owner deck.user.username
    json.user_id deck.user_id
    json.title deck.title
  end
end