json.array! @reservations do |reservation|
  json.id reservation.id
  json.check_in reservation.check_in
  json.check_out reservation.check_out
  json.room_id reservation.room_id
  json.user_id reservation.user_id
  json.created_at reservation.created_at
end
