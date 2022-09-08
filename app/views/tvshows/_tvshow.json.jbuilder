json.extract! tvshow, :id, :user_id, :name, :notes, :consumed, :starred, :created_at, :updated_at
json.url tvshow_url(tvshow, format: :json)
