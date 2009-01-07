module Ikbis
  module Simple
    class Base
      include HTTParty
      base_uri 'ikbis.com/api'
      
      # TODO: Format options
    end
 
  end # Simple
end # Ikbis