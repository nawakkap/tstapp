json.array!(@backlogs) do |backlog|
  json.extract! backlog, :id, :custname, :product_id, :productCode, :sono, :orderDate, :orderAmt, :backlog
  json.url backlog_url(backlog, format: :json)
end
