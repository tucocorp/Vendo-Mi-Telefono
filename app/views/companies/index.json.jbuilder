json.array!(@companies) do |company|
  json.extract! company, :id, :name, :description, :contact_phone
  json.url company_url(company, format: :json)
end
