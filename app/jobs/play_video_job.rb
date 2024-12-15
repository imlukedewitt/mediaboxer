class PlayVideoJob < ApplicationJob
  queue_as :default

  def perform(video)
    yt_options = "-f bestvideo+bestaudio/best -o - "
    yt_command = "yt-dlp #{yt_options} #{video.url}"
    mpv_command = "mpv - --force-seekable=yes -fs --input-ipc-server=/tmp/mpvsocket"
    system("#{yt_command} | #{mpv_command}")
  end
end
