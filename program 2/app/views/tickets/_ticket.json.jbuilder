json.extract! ticket, :id, :passengerid, :trainid, :confirmationnumber, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
