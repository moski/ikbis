module Ikbis
  module Advanced
    class Photo < Ikbis::Advanced::Media
         #######################################################
         # Set the class extention string for this class.
         ######################
         # @Created : Jan/19/2009
         # @LastRefactor : Jan/19/2009
         # @Author  : Monther Abushaikh <abushaikh@gmail.com>
         #######################################################
         def initialize
           @class_extention = "ikbis.photos"
           super ### call the media initialize function.
         end
         
         
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
         # @Created : DEC/31/2008
         # @LastRefactor : DEC/31/2008
         # @Author  : Moski
         #######################################################
         ### Auto-generated using method_missing ####
         
         
         #######################################################
         # getInfo
         #   -> Get all kinds of information about a photo
         #   -> If the calling user is logged in, this will return information 
         #   -> that calling user has access to (including private photos).
         #   -> If the calling user is not authenticated, this will only return 
         #      public information, or a permission denied error if none is available.
         # Parameters
         #   * int media_id (required) - Get information from this id
         #
         # ex:   getInfo('103678' , {:how => 'json'}) 
         #
         # Returns:
         #   -> <photo>\n  <id>103678</id>\n  <title>First Album</title>\n  <caption>Cool avatars</caption>\n  <views>171</views>\n          
         #      <category></category>\n  <owner>moski_doski</owner>\n  <comments>0</comments>\n  <rating>0</rating>\n  <thumbnails>\n    
         #      <small>http://shots.ikbis.com/image/103678/small/Another_ID_by_pyromaniac.png</small>\n    
         #      <thumb>http://shots.ikbis.com/image/103678/thumb/Another_ID_by_pyromaniac.png</thumb>\n    
         #      <medium_crop>http://shots.ikbis.com/image/103678/medium_crop/Another_ID_by_pyromaniac.png</medium_crop>\n    
         #      <medium>http://shots.ikbis.com/image/103678/medium/Another_ID_by_pyromaniac.png</medium>\n    
         #      <screen>http://shots.ikbis.com/image/103678/screen/Another_ID_by_pyromaniac.png</screen>\n    
         #      <big_screen>http://shots.ikbis.com/image/103678/big_screen/Another_ID_by_pyromaniac.png</big_screen>\n    
         #      <large>http://shots.ikbis.com/image/103678/large/Another_ID_by_pyromaniac.png</large>\n  </thumbnails>\n</photo>
         #
         # Authentication
         #   ->    Authentication is not required.
         ######################
         # @Created : DEC/31/2008
         # @LastRefactor : DEC/31/2008
         # @Author  : Moski
         #######################################################
         ### Auto-generated using method_missing ####
         
         
         #######################################################
         # getThumbnailUrl
         #   -> Get a thumbnail URL for a given photo/size
         # 
         # Parameters
         #   * int media_id (required) - Get information from this video
         #   * thumbnail_size: 
         #           small        "70x70"   and  crop => "1:1"
         #           thumb        "90x90"   and  crop => "1:1"
         #           medium_crop  "144x144" and  crop => "1:1"
         #           medium       "240x240" and  no crop
         #           screen       "420x420" and  no crop
         #           big_screen   "500x500" and no crop
         #           large        "800x800" and no crop
         #           all          return all sizes
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
         # @Created : DEC/31/2008
         # @LastRefactor : DEC/31/2008
         # @Author  : Moski
         ######################################################
         ### Auto-generated using method_missing ####
         
         
         #######################################################
         # setTitle
         #   -> Set the title of a photo (overwrites previous title) 
         # Parameters
         #   * int media_id (required) - Set the title of this photo.
         #   * string title (required) - The new title. 128 is the max length for this field, any longer and it will be trimmed.
         #
         # ex:   setTitle(media_id , "My cool new title" ,{:how => 'json'})
         #
         # Returns:
         #   ->  <rsp>ok</rsp>
         # Authentication
         #   ->    Authentication is required.
         ######################
         # @Created : DEC/31/2008
         # @LastRefactor : DEC/31/2008
         # @Author  : Monther Abushaikh <abushaikh@gmail.com>
         #######################################################
         ### Auto-generated using method_missing ####
         
         #######################################################
         # setCaption
         #   -> Set a new caption for a photo (overwrites previous caption)
         # Parameters
         #   * int media_id (required) - Set the title of this photo.
         #   * string caption (required) - The new caption.
         # Returns:
         #   ->  <rsp>ok</rsp>
         # Authentication
         #   ->    Authentication is required.
         ######################
         # @Created : DEC/31/2008
         # @LastRefactor : DEC/31/2008
         # @Author  : Monther Abushaikh <abushaikh@gmail.com>
         #######################################################
         ### Auto-generated using method_missing ####
         
         
    end ## end class
  end ## end Advanced
end ## end ikbis