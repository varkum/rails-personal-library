json.extract! article, :id, :user_id, :title, :author, :notes, :consumed, :starred, :created_at, :updated_at
json.url article_url(article, format: :json)
