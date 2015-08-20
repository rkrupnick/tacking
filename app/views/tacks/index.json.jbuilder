json.array!(@tacks) do |tack|
  json.extract! tack, :id, :description
  json.url tack_url(tack, format: :json)
end
