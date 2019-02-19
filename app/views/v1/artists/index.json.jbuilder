# json.array! @artists, partial: 'artists/artist', as: :artist

json.array! @artists do |artist|
  json.extract! artist, :id, :name
  json.created_at l(artist.created_at, format: :short)
end
