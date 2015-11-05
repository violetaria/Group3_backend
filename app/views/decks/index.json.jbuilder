 json.decks do
   json.array! @decks.each do |deck|
     #json.extract! deck.id, deck.title
   json.id deck.id
   json.title deck.title
   json.owner deck.user.username
  end
end