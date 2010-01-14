module Ikbis
  module Simple

    class User < Ikbis::Simple::Base
    
      base_uri "#{Base.base_uri}/users"
      
      def self.info(id, response='xml')
        get("/#{id}.#{response}")
      end

      def self.videos(id, response='xml', page=1)
        get("/#{id}/videos.#{response}?page=#{page}")
      end

      def self.photos(id, response='xml', page=1)
        get("/#{id}/photos.#{response}?page=#{page}")
      end

      def self.medias(id, response='xml', page=1)
        get("/#{id}/medias.#{response}?page=#{page}")
      end

      def self.favorites(id, response='xml', page=1)
        get("/#{id}/favorites.#{response}?page=#{page}")
      end

      def self.albums(id, response='xml', page=1)
        get("/#{id}/albums.#{response}?page=#{page}")
      end

      def self.channels(id, response='xml', page=1)
        get("/#{id}/channels.#{response}?page=#{page}")
      end

      def self.contacts(id, response='xml', page=1)
        get("/#{id}/contacts.#{response}?page=#{page}")
      end

      # this seems to be deprecated in api_2, there is no corresponding
      # contacts_medias action defined for users ... disabling this
      # by: ahmad@ikbis
      
      #def self.contacts_medias(id, response='xml', page=1)
        #get("/#{id}/contacts_medias.#{response}?page=#{page}")
      #end
    end
  end
end
