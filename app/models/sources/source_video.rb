module Sources
  class SourceVideo
    include ActiveModel::Validations
    attr_reader :url
    attr_reader :video_id

    validates :url, presence: true
    validates :video_id, presence: { message: "URL must be for a single YouTube video" }

    def initialize(url:)
      @url = url
    end

    def parse_url
      uri = URI.parse(@url)
      @video_id = URI::decode_www_form(uri.query).to_h['v']
    end

    def to_key
      [@video_id] if @video_id
    end

  end
end
