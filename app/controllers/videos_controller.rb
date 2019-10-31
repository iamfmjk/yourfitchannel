class VideosController < ApplicationController
  def index

  end

  def new
    @videos = current_user.videos.all
    @youtube_ids = @videos.map(&:youtube_id)
    @video = Video.new
    if source_video_params[:url].present?
      @source_video = Sources::SourceVideo.new(source_video_params.to_h.symbolize_keys)
      @source_video.parse_url
      @youtube_ids << @source_video.youtube_id
    end

  end

  def create
    @video = current_user.videos.create(video_params)
    @video.save
    redirect_to action: :new
  end

  private
  def video_params
    params.require(:video).permit(:youtube_id)
  end

  def source_video_params
    params.fetch(:source_video, {}).permit(:url)
  end


end
