class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
    if source_video_params[:url].present?
      @source_video = Sources::SourceVideo.new(source_video_params.to_h.symbolize_keys)
      @source_video.parse_url
    end
  end

  def create
    @video = Video.create(video_params)
  end

  private
  def video_params
    params.require(:video).permit(:url)
  end

  def source_video_params
    params.fetch(:source_video, {}).permit(:url)
  end


end
