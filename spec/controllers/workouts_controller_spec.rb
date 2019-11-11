require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do

  describe "workouts#new action" do

    it "should take user to new workout form" do
      user = FactoryBot.create(:user)
      sign_in user
      video = FactoryBot.create(:video)

      get :new, params: {video_id: video.id, user_id: user.id}
      expect(response).to have_http_status(:success)
    end

  end

  describe "workouts#edit action" do

    it "user should be logged in to edit workout" do
      user = FactoryBot.create(:user)
      video = FactoryBot.create(:video)
      workout = FactoryBot.create(:workout)
      get :edit, params: {id: workout.id, video_id: video.id, user_id: user.id}
      expect(response).to redirect_to new_user_session_path
    end

    it "only the user who created the workout is allowed to edit it" do
      video = FactoryBot.create(:video)
      workout = FactoryBot.create(:workout)
      user = FactoryBot.create(:user)
      sign_in user
      get :edit, params: {id: workout.id, video_id: video.id, user_id: user.id}
      expect(response).to have_http_status(:unprocessable_entity)

    end

    it "user should be able to edit their workout" do
      user = FactoryBot.create(:user)
      video = FactoryBot.create(:video)
      workout = FactoryBot.create(:workout)
      sign_in workout.user
      get :edit, params: {id: workout.id, video_id: video.id, user_id: user.id}
      expect(response).to have_http_status(:success)
    end

  end

  describe "workout#update action" do
    it "user should be logged in to modify existing workout" do
      user = FactoryBot.create(:user)
      video = FactoryBot.create(:video)
      workout = FactoryBot.create(:workout)
      patch :update, params: {id: workout.id, video_id: video.id, workout: {title: "Some new title"}, user_id: user.id}
      expect(response).to redirect_to new_user_session_path
    end

    it "only the user who created the workout is allowed to update it" do
      video = FactoryBot.create(:video)
      workout = FactoryBot.create(:workout)
      user = FactoryBot.create(:user)
      sign_in user
      patch :update, params: {id: workout.id, video_id: video.id, workout: {title: 'Some new title'}, user_id: user.id}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "user should be able to update their workout" do
      video = FactoryBot.create(:video)
      workout = FactoryBot.create(:workout, title: "Old title")
      user = FactoryBot.create(:user)
      sign_in workout.user
      patch :update, params: {id: workout.id, workout: {title: "Some new title"}, video_id: video.id, user_id: user.id}
      expect(response).to redirect_to user_workout_path(workout.user, workout)
      workout.reload
      expect(workout.title).to eq("Some new title")
    end

  end

end
