json.extract! passenger, :id, :name, :email, :phone, :address, :creditnumber, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)
