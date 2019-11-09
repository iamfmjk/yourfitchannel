require 'google/apis/youtube_v3'
require 'google/api_client/client_secrets'
require 'json'

class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token

  # before_action :set_time_zone, if: :user_signed_in?
  #
  # def set_time_zone
  #   Time.zone = current_user.time_zone
  # end

end
