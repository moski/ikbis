module Ikbis
  module Simple
    class Base
      include HTTParty
      base_uri 'ikbis.com/api'
      #base_uri 'localhost:3000/api'
      # TODO: Format options
    end
  end
end
