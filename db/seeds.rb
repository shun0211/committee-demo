publisher =  Publisher.create!(name: "JK-ローリング")

7.times do |n|
  book = Book.create!(title: "ハリーポッター#{n}巻", publisher: publisher)
end
