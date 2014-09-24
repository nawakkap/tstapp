json.array!(@machines) do |machine|
  json.extract! machine, :id, :name, :workdays, :workhours
  json.url machine_url(machine, format: :json)
end
