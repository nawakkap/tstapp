json.array!(@internal_values) do |internal_value|
  json.extract! internal_value, :id, :category, :name, :value, :seq
  json.url internal_value_url(internal_value, format: :json)
end
