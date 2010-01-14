module Ikbis
  module Advanced
    class Media < Ikbis::Advanced::Base
      
      #######################################################
      # Class constants:
      # I.  MEDIA_EXTENTION: used to override the methods names.
      # II. RESERVER:        List of reserved methods we don't need to
      #                      override.
      #######################################################
      MEDIA_EXTENTION = 'media_'
      RESERVED = ['initialize' , 'method_missing' , 'method_added']
      
      #######################################################
      # Try to generate the method name if its a valid method
      # name and call the paret class.
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Moski
      #######################################################
      def method_missing(key, *args, &block)
        if @@valid_methods.include?(key.to_s)                    
          (class << self; self; end).class_eval do
            define_method(key) do |*args|
               args.insert(0,"#{@class_extention}.#{key}")
               send "#{MEDIA_EXTENTION}#{key}" , *args
            end
          end
          send "#{key}" , *args
        else
          super
        end
      end ## end method_missing
       
      
      #######################################################
      # When a method is defined added to the valid_methods
      # array.
      # This is just overriding the ruby hook method(method_added)
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Moski
      ####################################################### 
      def self.method_added(name)
        @@valid_methods ||= []
        @@valid_methods << name.to_s.gsub(MEDIA_EXTENTION , '')
      end 
       
       
      protected


      #######################################################
      # Returns a sheet of all videos uploaded by user.
      # 
      # NOTE:
      #   Now requires user_id instead of username.
      #######################################################
      # @ LastRefactor: Jan/06/2010
      # @ Devs:
      #     Moski
      #     Ahmad
      #######################################################
      def getUploadedList(action_name , user_id, options = {})
        setup_what_how("videos" , options)

        # does not deal with medias controller, but with users instead...        
        options.merge!(:target => "users")
        options.merge!(:id => user_id)
        options.merge!(:method => "get")
        
        return send_request(options)
      end ## end function.
      
      
      #######################################################
      # Returns sheet of media info in specified format.
      #######################################################
      # @ LastRefactor: Jan/06/2010
      # @ Devs:
      #     Moski
      #     Ahmad
      #######################################################      
      def getInfo(action_name ,media_id  , options = {})
        # debug
        puts "------ getInfo routine ------"
        puts "* action_name => #{action_name}"
        puts "* options => #{options}"
        puts "--------------------------------"
        
        # action name is empty here because info is the default
        # GET response
        setup_what_how("" , options)
        options.merge!(:id => media_id)
        options.merge!(:method => "get")
        
        return send_request(options)
      end ## end function
      


      #######################################################
      # Returns URL pointing to the thumbnail picture requested
      # by size.
      #
      # params:
      #   * int media_id
      #   * string enum :size option
      #     {
      #      - medium_crop
      #      - screen
      #      - big_screen
      #      - medium
      #      - small
      #      - large
      #      - thumb
      #     }
      #
      #   ex media.getThumbnailUrl("204732", :size => "large")
      #######################################################
      # @ LastRefactor: Jan/06/2010
      # @ Devs:
      #     Moski
      #     Ahmad
      #######################################################
      def getThumbnailUrl(action_name , media_id  , options = {})

        # get vid info where thumb URIs are contained
        media = getInfo(media_id)
        
        # enforce a default value if none is provided
        size = (options[:size].empty?) ? "thumb" : options[:size]
        
        type = (media.type == "Image") ? "photo" : "video"
        
        # since HTTParty parses the XML into a ruby hash,
        # we only need to access the element and get our URI!
        thumb_uri = media['ikbis'][type]['thumbnails'][size]

        return thumb_uri
      end ## end function
      
      
      #######################################################
      # Modifies title of specified media that belongs to the logged
      # in user.
      #######################################################
      # @ LastRefactor: Jan/06/2010
      # @ Devs:
      #     Moski
      #     Ahmad
      #######################################################
      def setTitle(action_name , media_id  , title ,options = {})
        # using PUT method allows us to update without
        # specifying an action name, since it's a RESTful route
        setup_what_how("" , options)
        options.merge!(:method => "put")
        options.merge!(:id => media_id)
        options.merge!(:title => CGI.escape(title))
        
        return send_request(options)
      end

      #######################################################
      # Modifies caption of specified media that belongs to the 
      # logged in user.
      #######################################################
      # @ LastRefactor: Jan/06/2010
      # @ Devs:
      #     Moski
      #     Ahmad
      #######################################################      
      def setCaption(action_name,media_id  , caption ,options = {})
        setup_what_how("", options)
        options.merge!(:id => media_id)
        options.merge!(:caption => CGI.escape(caption))
        options.merge!(:method => "put")
        
        return send_request(options)
      end
      
      # DEPRECATED
      #def setFavorite(action_name, media_id  , favorite = 'yes' ,options = {})
      #  setup_what_how(action_name , options)
      #  options.merge!(:media_id => media_id)
      #  options.merge!(:favorite => favorite)
      #  return send_request(options)
      #end
      
      #######################################################
      # Adds 1 tag at a time to media.
      # NOTE:
      #   trying to add more than one tag using a ' ' space delimiter
      #   will result in an escaped '+' character instead. 
      #######################################################
      # @ LastRefactor: Jan/06/2010
      # @ Devs:
      #     Moski
      #     Ahmad
      #######################################################
      def addTag(action_name, media_id  , tags  ,options = {})
        setup_what_how("add_tag", options)
        options.merge!(:id => media_id)
        options.merge!(:tag => CGI.escape(tags))
        options.merge!(:method => "put")
        
        return send_request(options)
      end
      
      #######################################################
      # Removes all occurences of 'tag' in media's tags.
      #######################################################
      # @ LastRefactor: Jan/06/2010
      # @ Devs:
      #     Moski
      #     Ahmad
      #######################################################
      def removeTag(action_name, media_id  , tag  ,options = {})
        setup_what_how("remove_tag" , options)
        options.merge!(:id => media_id)
        options.merge!(:tag => CGI.escape(tag))
        options.merge!(:method => "put")
        
        return send_request(options)
      end
      
      
      #######################################################
      # Rename the Class methods by added the media extention to
      # it and remove the old definition.
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Moski
      #######################################################
      class_eval{instance_methods(false).each {|m| 
        unless RESERVED.include?(m)
          alias_method "#{MEDIA_EXTENTION}#{m}" , m ;undef_method m
        end
      }}
      
      
      private
      
      #######################################################
      # Just a common helper method to add the action_name and the
      # return type.
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Moski
      #######################################################
      def setup_what_how(action_name , options)
        options.merge!(:target => "medias")
        options.merge!(:what => action_name)
        options.merge!(:how => 'xml') unless options.has_key?(:how)
      end
      
      
    end ## end class
  end## end advanced
end ## end ikbis
