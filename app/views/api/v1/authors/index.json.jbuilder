json.array!(@authors) do |author|
  json.extract! author,
    :id,
    :first_name,
    :surname,
    :email,
    :about

  json.dates do
    json.created author.created_at
    json.updated author.updated_at
  end

  #json.url authors_url(author, format: :json)
end

