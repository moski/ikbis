module Ikbis
  module Simple

    class User < Ikbis::Simple::Base

      def self.info(username, response='xml')
        get("/user/info/#{username}/#{response}")
      end

      def self.videos(username, response='xml', page=1)
        get("/user/videos/#{username}/#{response}?page=#{page}")
      end

      def self.photos(username, response='xml', page=1)
        get("/user/photos/#{username}/#{response}?page=#{page}")
      end

      def self.medias(username, response='xml', page=1)
        get("/user/medias/#{username}/#{response}?page=#{page}")
      end

      def self.favorites(username, response='xml')
        get("/user/favorites/#{username}/#{response}")
      end

      def self.albums(username, response='xml', page=1)
        get("/user/albums/#{username}/#{response}?page=#{page}")
      end

      def self.channels(username, response='xml')
        get("/user/channels/#{username}/#{response}")
      end

      def self.contacts(username, response='xml')
        get("/user/contacts/#{username}/#{response}")
      end

      def self.contacts_medias(username, response='xml')
        get("/user/contacts_medias/#{username}/#{response}")
      end
    end
  end
end
