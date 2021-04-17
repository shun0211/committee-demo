json.set! :books do
  json.array! @books do |book|
    json.id book.id
    json.title book.title
    json.set! :publisher do
      json.id book.publisher.id
      json.name book.publisher.name
    end
  end
end
