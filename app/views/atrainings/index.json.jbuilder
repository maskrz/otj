json.array!(@atrainings) do |atraining|
  json.extract! atraining, :id, :comment
  json.url atraining_url(atraining, format: :json)
end
