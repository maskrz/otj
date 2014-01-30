json.array!(@athletes) do |athlete|
  json.extract! athlete, :id, :name, :surname, :birth, :email, :password, :state, :privacy
  json.url athlete_url(athlete, format: :json)
end
