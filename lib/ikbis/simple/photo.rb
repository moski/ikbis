module Ikbis
  module Simple
    class Photo < Ikbis::Simple::Base

      base_uri "#{Base.base_uri}/medias"
      
      def self.info(id, response='xml')
        get("/#{id}/#{response}")
      end

      def self.comments(id, response='xml')
        get("/#{id}/comments.#{response}")
      end

      def self.in_category(id, response='xml', page=1)
        get("/#{id}/category_medias.#{response}?page=#{page}&type=Photo")
      end

      def self.has_tag(tag, response='xml', page=1)
        get("#{Base.base_uri}/search/#{tag}/tags.#{response}?page=#{page}&type=Photo")
      end
      
    end
  end
end
