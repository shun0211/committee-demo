require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /books" do
    before do
      publisher = Publisher.create(name: "JK-ローリング")
      5.times do |n|
        Book.create!(title: "ハリーポッター第#{n + 1}巻", publisher: publisher)
      end
    end

    it "works! (now write some real specs)" do
      get books_path, as: :json
      expect(response).to have_http_status(200)
    end

    it 'return expected body schema' do
      get books_path, as: :json
      # binding.pry
      assert_response_schema_confirm
    end
  end
end
