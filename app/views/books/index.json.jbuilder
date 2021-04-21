json.set! :books do
  json.array! @books do |book|
    json.id book.id
    json.title book.title
    json.set! :authors do
      json.array! book.authors do |author|
        json.name author.name
      end
    end
  end
end
