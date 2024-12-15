class VideosController < ApplicationController
  def index
    @videos = Video.order(:position)
  end

  def create
    @video = Video.new(video_params)
    @video.position = Video.maximum(:position).to_i + 1

    if @video.save
      redirect_to videos_path
    else
      render :new
    end
  end

  def play
    @video = Video.find(params[:id])
    PlayVideoJob.perform_later(@video)
    redirect_to videos_path, notice: "Now playing video"
  end

  private

  def video_params
    params.require(:video).permit(:url, :title)
  end
end
