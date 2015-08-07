json.array!(@nfc_urls) do |nfc_url|
  json.extract! nfc_url, :id, :name, :cardid, :behaviour, :condition
  json.url nfc_url_url(url, format: :json)
end
