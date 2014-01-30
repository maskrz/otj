json.array!(@gathletes) do |gathlete|
  json.extract! gathlete, :id
  json.url gathlete_url(gathlete, format: :json)
end
