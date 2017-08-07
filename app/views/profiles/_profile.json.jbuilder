json.extract! profile, :id, :user_id, :name, :age, :location, :gender, :created_at, :updated_at
json.url profile_url(profile, format: :json)
