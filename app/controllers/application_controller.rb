require 'google/apis/youtube_v3'
require 'google/api_client/client_secrets'
require 'json'

class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token

end
