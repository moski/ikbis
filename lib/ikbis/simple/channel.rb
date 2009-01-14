module Ikbis
  module Simple

    class Channel < Ikbis::Simple::Base

      def self.info(channel, response='xml')
        get("/channel/info/#{channel}/#{response}")
      end

      def self.videos(channel, response='xml', page=1)
        get("/channel/videos/#{channel}/#{response}?page=#{page}")
      end

      def self.subscribers(channel, response='xml')
        get("/channel/subscribers/#{channel}/#{response}")
      end
    end
  end
end
