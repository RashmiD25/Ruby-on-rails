json.extract! review, :id, :passengerid, :trainid, :rating, :feedback, :created_at, :updated_at
json.url review_url(review, format: :json)
