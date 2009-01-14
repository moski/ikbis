module Ikbis
  module Simple

    class Photo < Ikbis::Simple::Base

      def self.info(id, response='xml')
        get("/photo/info/#{id}/#{response}")
      end

      def self.comments(id, response='xml')
        get("/photo/comments/#{id}/#{response}")
      end

      def self.in_category(category, response='xml', page=1)
        get("/photo/in_category/#{category}/#{response}?page=#{page}")
      end

      def self.has_tag(tag, response='xml', page=1)
        get("/photo/has_tag/#{tag}/#{response}?page=#{page}")
      end
    end
  end
end
