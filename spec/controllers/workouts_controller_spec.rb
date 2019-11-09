require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do
  describe "workouts#new action" do
    it "should take user to new workout form" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
