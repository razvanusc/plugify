json.array! @requests do |request|
  json.extract! request, :id, :price
end
