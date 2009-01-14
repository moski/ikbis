module Ikbis
  module Simple

    class Video < Ikbis::Simple::Base

      def self.info(id, response='xml')
        get("/video/info/#{id}/#{response}")
      end

      def self.comments(id, response='xml')
        get("/video/comments/#{id}/#{response}")
      end

      def self.in_category(category, response='xml', page=1)
        get("/video/in_category/#{category}/#{response}?page=#{page}")
      end

      def self.has_tag(tag, response='xml', page=1)
        get("/video/has_tag/#{tag}/#{response}?page=#{page}")
      end
    end
  end
end
