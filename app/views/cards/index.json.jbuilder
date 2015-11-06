json.cards do
   json.array! @cards.each do |card|
     #json.extract! card.id,
   json.id card.id
   json.front card.front
   json.back card.back
  end
end