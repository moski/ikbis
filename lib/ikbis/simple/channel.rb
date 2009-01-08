module Ikbis
  module Simple

    class Channel < Ikbis::Simple::Base
      base_uri 'ikbis.com/api/channel'

      def info(channel, response='xml')
        get("info/#{channel}/#{response}")
      end

      def videos(channel, response='xml')
        get("videos/#{channel}/#{response}")
      end

      def subscribers(channel, response='xml')
        get("subscribers/#{channel}/#{response}")
      end
    end
  end
end
