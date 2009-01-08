module Ikbis
  module Advanced
    class Base
      include HTTParty
      base_uri 'dev.ikbis.com'
 
      class CouldNotLoadCredentials < Exception; end
      class CouldNotPost < Exception; end
      
      attr_reader :access_token
      
      #######################################################
      # Authenticate using OAuth::Consumer.
      # After calling this method, the user will be logged in
      # in to ikbis and can use all the private methods.
      # 
      # Prerequisites:
      #   Must call ikbis-auth to generate the credentials yaml file.
      # 
      ######################
      # @Created : DEC/31/2007
      # @LastRefactor : DEC/31/2007
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      def oauth_authentication(credential_file='credentials.yml')
        begin
          @credentials = YAML.load_file(credential_file)
        rescue
          raise CouldNotLoadCredentials, "Couldn't load your ikbis credentials. You may need to run ikbis-auth."
        end
        @consumer = OAuth::Consumer.new(@credentials[:consumer_key], @credentials[:consumer_secret], {:site => "http://dev.ikbis.com"})
        @access_token = OAuth::AccessToken.new(@consumer, @credentials[:access_token], @credentials[:access_token_secret])
      end
      
      protected
      
      #######################################################
      # Send the request to ikbis and return the results.
      # If @access_token is defined use OAuth::Consumer else use
      # HTTParty to send request.
      # 
      # Return:
      #   The html body
      ######################
      # @Created : DEC/31/2007
      # @LastRefactor : DEC/31/2007
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      def send_request(options)
        if @access_token.nil? 
          return self.class.post('/api/rest', :query => options)
        else
          return @access_token.post('/api/rest' , options).body
        end
      end ## end send_request
    end ## end Base
  end ## end Advanced
end ## end ikbis