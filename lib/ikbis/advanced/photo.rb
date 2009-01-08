module Ikbis
  module Advanced
    class Photo < Ikbis::Advanced::Base
      #######################################################
      # getUploadedList
      #   -> This gets a list of photos uploaded by the specified user.
      #   -> If the calling user is logged in, this will return information that calling 
      #   -> user has access to (including private photos). If the calling user is not authenticated, 
      #   -> this will only return public information, or a permission denied error if none is available.
      # 
      # Parameters
      #   * string username- ex.(moski_doski)
      #   * options:
      #   *   int page - Which page to show.
      #   *   int per_page - How many results per page?  
      #   *   string how - xml or json or php
      # 
      # ex:   getUploadedList('moski_doski' , {:how => 'json'}) 
      #
      # Returns:
      #   -> <photos>
      #        <photo>
      #           <id>142139</id>   
      #           <title>In the office</title>
      #           <caption>In the office</caption>    
      #           <views>61</views>\n    
      #           <category></category>\n    
      #           <owner>moski_doski</owner>\n    
      #           <comments>0</comments>\n    
      #           <rating>0</rating>\n    
      #           <thumbnails>\n      
      #             <small>http://shots.ikbis.com/image/142139/small/Photo_107.jpg</small>\n      
      #             <thumb>http://shots.ikbis.com/image/142139/thumb/Photo_107.jpg</thumb>\n      
      #             <medium_crop>http://shots.ikbis.com/image/142139/medium_crop/Photo_107.jpg</medium_crop>\n      
      #             <medium>http://shots.ikbis.com/image/142139/medium/Photo_107.jpg</medium>\n         
      #             <screen>http://shots.ikbis.com/image/142139/screen/Photo_107.jpg</screen>\n      
      #             <big_screen>http://shots.ikbis.com/image/142139/big_screen/Photo_107.jpg</big_screen>\n      
      #             <large>http://shots.ikbis.com/image/142139/large/Photo_107.jpg</large>\n    
      #           </thumbnails>\n  
      #       </photo>
      #     </photos>
      #
      # Authentication
      #   ->    Authentication is not required.
      ######################
      # @Created : DEC/31/2007
      # @LastRefactor : DEC/31/2007
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      def getUploadedList(username  , options = {})
        options.merge!(:what => "ikbis.photos.getUploadedList")
        options.merge!(:how => 'xml') unless options.has_key?(:how)
        options.merge!(:username => CGI.escape(username))
        return send_request(options)
      end ## end function.
    end ## end class
  end ## end Advanced
end ## end ikbis