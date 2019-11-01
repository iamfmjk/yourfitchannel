module GoogleServices
  class YoutubeVideo
    attr_reader :title, :youtube_id

    def initialize(youtube_id:, title:)
      @youtube_id = youtube_id
      @title = title
    end

    def self.find(youtube_id)
      youtube_video_info = YoutubeService.get_youtube_video_info(youtube_id)
      title = get_title(youtube_video_info)
      youtube_video = YoutubeVideo.new(youtube_id: youtube_id, title: title)

      return youtube_video

    end

    protected
    
    def self.get_title(youtube_video_info)
      return youtube_video_info.items.first.snippet.title
    end

  end
end
