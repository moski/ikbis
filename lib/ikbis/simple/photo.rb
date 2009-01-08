module Ikbis
  module Simple

    class Photo < Ikbis::Simple::Base
      base_uri 'ikbis.com/api/photo'

      def info(id, response='xml')
        get("info/#{id}/#{response}")
      end

      def comments(id, response='xml')
        get("comments/#{id}/#{response}")
      end

      def in_category(category, response='xml')
        get("in_category/#{category}/#{response}")
      end

      def has_tag(tag, response='xml')
        get("has_tag/#{tag}/#{response}")
      end
    end
  end
end
