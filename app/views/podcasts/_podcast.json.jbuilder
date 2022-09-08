json.extract! podcast, :id, :user_id, :name, :podcast, :url, :notes, :consumed, :starred, :created_at, :updated_at
json.url podcast_url(podcast, format: :json)
