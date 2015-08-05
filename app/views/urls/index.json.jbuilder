json.array!(@urls) do |url|
  json.extract! url, :id, :name, :cardid, :behaviour, :condition
  json.url url_url(url, format: :json)
end
