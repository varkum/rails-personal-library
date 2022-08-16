json.extract! movie, :id, :user_id, :name, :notes, :starred, :consumed, :created_at, :updated_at
json.url movie_url(movie, format: :json)
