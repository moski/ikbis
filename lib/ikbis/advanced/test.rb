module Ikbis
  module Advanced
    
    class Test < Ikbis::Advanced::Base
      def test_echo(options={})
         options.merge!(:what => "ikbis.test.echo")
         options.merge!(:how => 'xml') unless options.has_key?(:how)
         response = @access_token.post('/api/rest' , options)
         return response.body
      end ## end test_echo
      
      #######################################################
      # ikbis.test.login
      #   -> Is the user logged in?
      # Returns:
      #   -> <profile>
      #   ->      <id>25874</id> 
      #   ->      <username>moski_doski</username>
      #   -> </profile>
      # Error Codes:
      #   ->  205: Not Logged in
      ######################
      # @Created : DEC/31/2007
      # @LastRefactor : DEC/31/2007
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      def test_login(options = {})
        options.merge!(:what => "ikbis.test.login")
        options.merge!(:how => "xml") unless options.has_key?(:how)
        return send_request(options)
      end ## end test_login
    
      #######################################################
      # ikbis.test.ping
      #   -> This is just a simple ping test...
      # Returns:
      #   -> <rsp>ok</rsp>
      ######################
      # @Created : DEC/31/2007
      # @LastRefactor : DEC/31/2007
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      def test_ping(options = {})
        options.merge!(:what => "ikbis.test.ping")
        options.merge!(:how => 'xml') unless options.has_key?(:how)
        return send_request(options)
      end ## end test_ping
    end
  end ## end Advanced
end ## end ikbis