json.stars do
  json.count @stars.count
  json.users do
    json.array! @stars.each do |star|
      json.username star.user.username
      json.id star.user_id
    end
  end
end