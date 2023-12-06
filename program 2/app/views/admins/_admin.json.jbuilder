json.extract! admin, :id, :username, :name, :phone, :address, :creditnumber, :created_at, :updated_at
json.url admin_url(admin, format: :json)
