module GoogleServices
  class YoutubeService

    def self.get_service
      youtube = Google::Apis::YoutubeV3::YouTubeService.new
      youtube.key = Rails.application.credentials[:youtube_api_key]
      return youtube
    end

    def self.get_youtube_video_info(youtube_id)
      youtube = self.get_service
      return youtube.list_videos("snippet", id: youtube_id)
    end

  end
end
