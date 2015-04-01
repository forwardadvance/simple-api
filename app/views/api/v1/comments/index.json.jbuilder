json.array!(@comments) do |comment|
  json.extract! comment,
    :id,
    :article_id,
    :content,
    :name,
    :email,
    :website

  json.dates do
    json.created comment.created_at
    json.updated comment.updated_at
  end

  #json.url comments_url(comment, format: :json)
end

