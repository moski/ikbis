module Ikbis
  module Advanced
    class Base
      include HTTParty
      base_uri 'ikbis.com'
      #base_uri  'localhost:3000'
      
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
        @consumer = OAuth::Consumer.new(@credentials[:consumer_key], @credentials[:consumer_secret], {:site => "http://localhost:3000"})
        @access_token = OAuth::AccessToken.new(@consumer, @credentials[:access_token], @credentials[:access_token_secret])
      end
      
      protected
      
      #######################################################
      # Send the request to ikbis and return the results.
      # If @access_token is defined use OAuth::Consumer else use
      # HTTParty to send request.
      # 
      # Params:
      #   :method => 
      #     enum(get | post | put | delete)
      #   :id => 
      #     id of the resource we're manipulating
      #   :what =>
      #     method to perform, if empty, action taken will be controlled by the provided method, 
      #     ie :method => get and :what => "" will retrieve the resource's info
      #        :method => post and :what => "" will create a resource
      #        :method => put and :what => "add_tag" will add a tag to resource with :id
      #   :how => 
      #     defines type of response; enum(xml | json | rb | php)
      #
      # Return:
      #   See :how in Params.
      ######################
      # @Created : DEC/31/2007
      # @LastRefactor : Jan/13/2010
      #   by: ahmad@ikbis
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      def send_request(options)

        # construct our RESTful request URI
        uri = "#{Base.base_uri}/api/#{options[:target]}"
        uri += "/#{options[:id]}" if options.has_key?(:id)
        uri += "/#{options[:what]}" if options.has_key?(:what)
        uri += ".#{options[:how]}" if options[:method] == "get"
        puts "|---------------------  SEND_REQUEST  ---------------------|"
        puts "| URI"
        puts "|   #{uri}"
        puts "| Params"
        puts "|   id => #{options[:id]}"
        puts "|   what => #{options[:what]}"
        puts "|   how => #{options[:how]}"
        puts "|--------------------- ------------ ---------------------|"
        
        if @access_token.nil? 
          return self.class.send(options[:method] || "get", uri, options)
        else
          return @access_token.send(options[:method] || "get", uri, options).body
        end
        
      end ## end send_request
    end ## end Base
  end ## end Advanced
end ## end ikbis
