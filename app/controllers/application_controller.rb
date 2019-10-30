require 'google/apis/youtube_v3'
require 'google/api_client/client_secrets'
require 'json'

class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token
  def youtube
      secrets = Google::APIClient::ClientSecrets.new(
        {
          "web" =>
            {
              "access_token" => current_user.token,
              "refresh_token" => current_user.refresh_token,
              "client_id" => Rails.application.secrets[:google_client_id],
              "client_secret" => Rails.application.secrets[:google_client_secret]
            }
        }
      )
      service = Google::Apis::YoutubeV3::YouTubeService.new
      service.authorization = secrets.to_authorization
      channel = youtube.list_channels(part, :mine => mine)
      render json: response
    end
  end
