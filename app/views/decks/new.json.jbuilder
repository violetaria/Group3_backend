json.deck do
  json.user_id @deck.user_id
  json.owner @deck.user.username
  json.title @deck.title
end