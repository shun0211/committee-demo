require 'rails_helper'

RSpec.describe "Books", type: :request do
  # schema check
  describe "GET /books" do
    before do
      publisher = Publisher.create(name: "JK-ローリング")
      5.times do |n|
        Book.create!(title: "ハリーポッター第#{n + 1}巻", publisher: publisher)
      end
    end

    # it 'return expected body schema' do
    #   get books_path, as: :json
    #   assert_response_schema_confirm
    # end
  end

  describe "GET /books" do
    it "本が取得できること" do
      create_list(:book, 3)
      get "/books", as: :json
      expect(json["books"].count).to eq 3
    end

    it "本が取得できること" do
      create_list(:book, 3, title: "デルトラ・クエスト")
      get "/books", as: :json
      expect(json["books"].first["title"]).to eq "デルトラ・クエスト"
    end

    it "本の著者が取得できること" do
      create_list(:book, 3)
      get "/books", as: :json
      binding.pry
      expect(json["books"].first["authors"].first["name"]).to eq "デルトラ・クエスト"
    end
  end

  describe "GET /books/:id" do
    it "指定した本が取得できること" do
      book = create(:book)
      get "/books/#{book.id}", as: :json
      expect(json["title"]).to eq "ハリーポッターと賢者の石"
    end

    it "本の著者が取得できること" do
      book = create(:book)
      author = create(:author, books: [book])
      get "/books/#{book.id}", as: :json
      expect(json["authors"].first["name"]).to eq "JKローリング"
    end
  end
end
