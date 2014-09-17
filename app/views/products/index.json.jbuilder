json.array!(@products) do |product|
  json.extract! product, :id, :code, :name, :estWeight, :machine, :speed
  json.url product_url(product, format: :json)
end
