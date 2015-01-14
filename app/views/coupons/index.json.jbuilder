json.array!(@coupons) do |coupon|
  json.extract! coupon, :id, :end_date, :barcode, :user_id, :customer_id, :price, :buy_id, :state
  json.url coupon_url(coupon, format: :json)
end
