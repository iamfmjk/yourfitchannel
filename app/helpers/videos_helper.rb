module VideosHelper

  extend ActionView::Helpers::OutputSafetyHelper

  def self.render_youtube_placeholder(youtube_id)
    raw "<div id=\"#{self.youtube_player_id(youtube_id)}\"></div>"
  end

  def self.render_youtube_players(youtube_ids)
    js_players = youtube_ids.map { |youtube_id|
      <<-JSPLAYER
      new YT.Player('#{self.youtube_player_id(youtube_id)}', {
        videoId: '#{youtube_id}',
        events: {
          'onReady': onPlayerReady,
          'onStateChange': onPlayerStateChange
        },
        playerVars: {
          'enablejsapi' : 1,
          'origin' : window.location.origin
        }
      });
      JSPLAYER
    }.join("\n")

    raw <<-END
    <script>
      // This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // This function creates an <iframe> (and YouTube player)
      // after the API code downloads.
      function onYouTubeIframeAPIReady() {
        #{js_players}
      }
      function onPlayerReady(event) {}
      function onPlayerStateChange(event) {}
    </script>
    END
  end

  private

  def self.youtube_player_id(youtube_id)
    return "player_#{youtube_id}"
  end
end
