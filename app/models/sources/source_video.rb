module Sources
  class SourceVideo
    include ActiveModel::Validations
    attr_reader :url
    attr_reader :youtube_id

    validates :url, presence: true
    validates :youtube_id, presence: { message: "URL must be for a single YouTube video" }

    def initialize(url:)
      @url = url
    end

    def parse_url
      uri = URI.parse(@url)
      if uri.host.include? "youtu.be"
        @youtube_id = URI(uri).path.split("/").last
      else
        @youtube_id = URI::decode_www_form(uri.query).to_h['v']
      end
    end

    def to_key
      [@youtube_id] if @youtube_id
    end

  end
end
