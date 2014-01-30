json.array!(@groups) do |group|
  json.extract! group, :id, :name, :quantity
  json.url group_url(group, format: :json)
end
