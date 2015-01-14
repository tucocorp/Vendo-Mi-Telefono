json.array!(@trademarks) do |trademark|
  json.extract! trademark, :id, :name
  json.url trademark_url(trademark, format: :json)
end
