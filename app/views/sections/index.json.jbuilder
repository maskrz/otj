json.array!(@sections) do |section|
  json.extract! section, :id, :length, :time, :break
  json.url section_url(section, format: :json)
end
