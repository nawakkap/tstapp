json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :product_id, :code, :inventory
  json.url inventory_url(inventory, format: :json)
end
