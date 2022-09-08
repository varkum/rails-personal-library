json.extract! tweet, :id, :user_id, :author, :url, :notes, :consumed, :starred, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
