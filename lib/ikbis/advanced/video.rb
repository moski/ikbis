module Ikbis
  module Advanced
    class Video < Ikbis::Advanced::Base
      
      #######################################################
      # getUploadedList
      #   -> This gets a list of videos uploaded by the specified user.
      #   -> If the calling user is logged in, this will return information that calling 
      #   -> user has access to (including private videos). If the calling user is not authenticated, 
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
      #   -> <videos>
      #       <video>  
      #         <id>106502</id>  <title>كيف توكل منسف اردني</title> <caption>كيف توكل منسف اردني </caption> <views>319</views>
      #         <thumbnails>
      #             <small>http://shots.ikbis.com/video_thumbnail/106502/small/video.jpg</small>
      #             <thumb> http://shots.ikbis.com/video_thumbnail/106502/thumb/video.jpg </thumb>     
      #             <medium_crop>http://shots.ikbis.com/video_thumbnail/106502/medium_crop/video.jpg</medium_crop>
      #             <medium>http://shots.ikbis.com/video_thumbnail/106502/medium/video.jpg</medium>
      #             <screen>http://shots.ikbis.com/video_thumbnail/106502/screen/video.jpg</screen>  
      #         </thumbnails>     
      #       </video>    
      #     </videos>  
      #
      # Authentication
      #   ->    Authentication is not required.
      ######################
      # @Created : DEC/31/2007
      # @LastRefactor : DEC/31/2007
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      def getUploadedList(username  , options = {})
        options.merge!(:what => "ikbis.videos.getUploadedList")
        options.merge!(:how => 'xml') unless options.has_key?(:how)
        options.merge!(:username => CGI.escape(username))
        return send_request(options)
      end ## end function.
      
      
      
      
      
      
      
      
      
      
      
      
      
    end ## end video
  end ## end Advanced
end ## end ikbis