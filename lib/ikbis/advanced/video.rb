module Ikbis
  module Advanced
    class Video < Ikbis::Advanced::Media
      
      #######################################################
      # Set the class extention string for this class.
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Moski
      #######################################################
      def initialize
         @class_extention = "ikbis.videos"
         super ### call the media initialize function.
      end
      
      
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
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Moski
      #######################################################
      ### Auto-generated using method_missing ####
      
      
      #######################################################
      # getInfo
      #   -> Get all kinds of information about a video
      #   -> If the calling user is logged in, this will return information 
      #   -> that calling user has access to (including private videos).
      #   -> If the calling user is not authenticated, this will only return 
      #      public information, or a permission denied error if none is available.
      # Parameters
      #   * int media_id (required) - Get information from this video
      #
      # ex:   getInfo('moski_doski' , {:how => 'json'}) 
      #
      # Returns:
      #   -> <video>
      #         <id>110774</id>
      #         <title> the reason</title>
      #         <caption>\r\nthe reason\r\n</caption>
      #         <views>136</views>  
      #         <category></category>  
      #         <owner>moski_doski</owner> 
      #         <comments>0</comments> 
      #         <rating>0</rating>
      #         <thumbnails>
      #           <small>http://shots.ikbis.com/video_thumbnail/110774/small/video.jpg</small>\n        
      #           <thumb>http://shots.ikbis.com/video_thumbnail/110774/thumb/video.jpg</thumb>\n    
      #           <medium_crop>http://shots.ikbis.com/video_thumbnail/110774/medium_crop/video.jpg</medium_crop>
      #           ..........
      #         </thumbnails>          
      #      </video>
      #
      # Authentication
      #   ->    Authentication is not required.
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Moski
      #######################################################
      ### Auto-generated using method_missing ####
      
      
      #######################################################
      # getThumbnailUrl(media_id)
      #   -> Get a thumbnail URL for a given video/size
      #   -> 
      # Parameters
      #   * int media_id (required) - Get information from this video
      #   * thumbnail_size: 
      #           small        "70x70"   and  crop => "1:1"
      #           thumb        "90x90"   and  crop => "1:1"
      #           medium_crop  "144x144" and  crop => "1:1"
      #           medium       "240x240" and  no crop
      #           screen       "420x420" and  no crop
      #           all          return all sizes
      #
      # ex:   getThumbnailUrl(media_id , {:how => 'json'})
      #
      # Returns:
      #   ->   <thumbnails>
      #           <small>http://shots.ikbis.com/video_thumbnail/110774/small/video.jpg</small>\n        
      #           <thumb>http://shots.ikbis.com/video_thumbnail/110774/thumb/video.jpg</thumb>\n    
      #           <medium_crop>http://shots.ikbis.com/video_thumbnail/110774/medium_crop/video.jpg</medium_crop>
      #           ..........
      #       </thumbnails>
      # Authentication
      #   ->    Authentication is not required.
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Moski
      #######################################################
      ### Auto-generated using method_missing ####
      
      
      #######################################################
      # setTitle
      #   -> Set the title of a video (overwrites previous title) 
      # Parameters
      #   * int media_id (required) - Set the title of this video.
      #   * string title (required) - The new title. 128 is the max length for this field, any longer and it will be trimmed.
      #
      # ex:   getThumbnailUrl(media_id , {:how => 'json'})
      #
      # Returns:
      #   ->  <rsp>ok</rsp>
      # Authentication
      #   ->    Authentication is required.
      ######################
      # @Created : DEC/31/2007
      # @LastRefactor : DEC/31/2007
      # @Author  : Moski
      #######################################################
      ### Auto-generated using method_missing ####
      
      #######################################################
      # setCaption
      #   -> Set a new caption for a video (overwrites previous caption)
      # Parameters
      #   * int media_id (required) - Set the title of this video.
      #   * string caption (required) - The new caption.
      # Returns:
      #   ->  <rsp>ok</rsp>
      # Authentication
      #   ->    Authentication is required.
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Moski
      #######################################################
      ### Auto-generated using method_missing ####
      
      
      
    end ## end video
  end ## end Advanced
end ## end ikbis