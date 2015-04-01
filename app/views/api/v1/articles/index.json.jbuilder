json.array!(@articles) do |article|
  json.extract! article,
    :id,
    :title,
    :intro,
    :content,
    :author_id

  json.dates do
    json.created article.created_at
    json.updated article.updated_at
  end

  #json.url articles_url(article, format: :json)
end

