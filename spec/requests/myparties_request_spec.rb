require 'rails_helper'

RSpec.describe "Myparties", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/myparties/show"
      expect(response).to have_http_status(:success)
    end
  end

end
