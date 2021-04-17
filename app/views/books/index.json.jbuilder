json.set! :books do
  json.array! @books do |book|
    json.id book.id
    json.title book.title
    json.publisher book.publisher.name
  end
end
