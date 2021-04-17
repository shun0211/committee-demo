require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /books" do
    it "works! (now write some real specs)" do
      get books_path, as: :json
      expect(response).to have_http_status(200)
    end

    it 'return expected body schema' do
      get books_path, as: :json
      assert_response_schema_confirm
    end
  end
end
