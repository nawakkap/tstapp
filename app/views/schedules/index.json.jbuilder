json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :backlog_id, :sono, :productCode, :deliveryDate, :priority, :amt, :seq, :scheduler
  json.url schedule_url(schedule, format: :json)
end
