module Ikbis
  module Simple
    
    class User < Ikbis::Simple::Base
      # Returns this user's information.
      def self.info(username)
        ## ### get("/#{username}/info/json") ####
      end
    end
  end
end