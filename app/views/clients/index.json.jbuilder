json.array!(@clients) do |client|
  json.extract! client, :id, :firstname, :lastname, :birthdate, :genre, :identification_number, :cuilt
  json.url client_url(client, format: :json)
end
