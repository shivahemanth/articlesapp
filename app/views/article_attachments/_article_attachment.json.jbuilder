json.extract! article_attachment, :id, :article_id, :avatar, :created_at, :updated_at
json.url article_attachment_url(article_attachment, format: :json)
