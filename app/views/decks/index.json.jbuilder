 json.decks do
   json.array! @decks.each do |deck|
     json.id deck.id
     json.title deck.title
     json.owner deck.user.username
     json.stars deck.stars.count
  end
end