json.extract! ticket, :id, :ticket_type, :ticket_price, :place_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
