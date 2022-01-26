json.array! @rooms do |room|
  json.id room.id
  json.name room.name
  json.city room.city
  json.rate room.rate
  json.room_type room.room_type
  json.amenities room.amenities
  json.picture room.picture
  json.created_at room.created_at
end
