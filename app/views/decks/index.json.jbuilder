 json.decks do
   json.array! @decks.each do |deck|
     json.id deck.id
     json.title deck.title
     json.owner deck.user.username
     json.stars deck.stars.count
     json.starred_by_me deck.stars.find_by(user_id: current_user.id) != nil
  end
end