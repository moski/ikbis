module Ikbis
  module Advanced
    
    class Base
      include HTTParty
      base_uri 'dev.ikbis.com'
 
      class CouldNotLoadCredentials < Exception; end
      class CouldNotPost < Exception; end
      
      attr_reader :access_token
      
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