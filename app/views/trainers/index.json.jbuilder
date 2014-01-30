json.array!(@trainers) do |trainer|
  json.extract! trainer, :id, :name, :surname, :birth, :email, :state
  json.url trainer_url(trainer, format: :json)
end
