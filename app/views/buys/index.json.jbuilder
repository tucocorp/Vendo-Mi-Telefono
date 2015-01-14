json.array!(@buys) do |buy|
  json.extract! buy, :id, :user_id, :customer_id
  json.url buy_url(buy, format: :json)
end
