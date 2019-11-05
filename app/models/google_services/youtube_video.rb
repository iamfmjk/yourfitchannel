module GoogleServices
  class YoutubeVideo
    attr_reader :title, :youtube_id, :standard_thumbnail

    def initialize(youtube_id:, title:, standard_thumbnail:)
      @youtube_id = youtube_id
      @title = title
      @standard_thumbnail = standard_thumbnail
    end

    def self.find(youtube_id)
      youtube_video_info = YoutubeService.get_youtube_video_info(youtube_id)
      title = get_title(youtube_video_info)
      standard_thumbnail = get_thumbnail(youtube_video_info)
      youtube_video = YoutubeVideo.new(youtube_id: youtube_id, title: title, standard_thumbnail: standard_thumbnail)

      return youtube_video

    end

    protected

    def self.get_title(youtube_video_info)
      return youtube_video_info.items.first.snippet.title
    end

    def self.get_thumbnail(youtube_video_info)
      return youtube_video_info.items.first.snippet.thumbnails.standard.url
    end

  end
end
