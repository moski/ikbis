module Ikbis
  module Simple

    class User < Ikbis::Simple::Base
      base_uri 'ikbis.com/api/user'

      def self.info(username, response='xml')
        get("/info/#{username}/#{response}")
      end

      def self.videos(username, response='xml')
        get("/videos/#{username}/#{response}")
      end

      def self.photos(username, response='xml')
        get("/photos/#{username}/#{response}")
      end

      def self.medias(username, response='xml')
        get("/medias/#{username}/#{response}")
      end

      def self.favorites(username, response='xml')
        get("/favorites/#{username}/#{response}")
      end

      def self.albums(username, response='xml')
        get("/albums/#{username}/#{response}")
      end

      def self.channels(username, response='xml')
        get("/channels/#{username}/#{response}")
      end

      def self.conctacts(username, response='xml')
        get("/conctacts/#{username}/#{response}")
      end

      def self.conctacts_medias(username, response='xml')
        get("/conctacts_medias/#{username}/#{response}")
      end
    end
  end
end
