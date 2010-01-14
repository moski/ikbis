module Ikbis
  module Simple

    class Channel < Ikbis::Simple::Base
    
      base_uri "#{Base.base_uri}/channels"
      
      def self.info(id, response='xml')
        get("/#{id}.#{response}")
      end

      def self.videos(id, response='xml', page=1)
        get("/#{id}/videos.#{response}?page=#{page}")
      end

      def self.subscribers(id, response='xml')
        get("/#{id}/subscribers.#{response}")
      end
    end
  end
end
