json.reservation do
  json.id @reservation.id
  json.nights @reservation.nights
  json.check_in @reservation.check_in
  json.check_out @reservation.check_out
  json.room_id @reservation.room_id
  json.user_id @reservation.user_id
  json.created_at @reservation.created_at
end
