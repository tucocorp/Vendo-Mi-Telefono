json.array!(@buy_details) do |buy_detail|
  json.extract! buy_detail, :id, :model_id, :buy_id, :state_id, :imei, :price
  json.url buy_detail_url(buy_detail, format: :json)
end
