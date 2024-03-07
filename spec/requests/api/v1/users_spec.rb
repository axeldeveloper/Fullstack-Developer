require 'rails_helper'

RSpec.describe "API::V1::Users", type: :request do
  describe "GET /api/v1/users" do
    it "returns a success response" do
      get "/api/v1/users"
      expect(response).to have_http_status(:success)
    end
  end
end