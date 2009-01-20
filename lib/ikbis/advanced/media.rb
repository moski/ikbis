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

      def getUploadedList(action_name , username , options = {})
        setup_what_how(action_name , options)
        options.merge!(:username => CGI.escape(username))
        return send_request(options)
      end ## end function.
      
      
      def getInfo(action_name ,media_id  , options = {})
        setup_what_how(action_name , options)
        options.merge!(:media_id => media_id)
        return send_request(options)
      end ## end function
      
      
      def getThumbnailUrl(action_name , media_id  , options = {})
        setup_what_how(action_name , options)
        options.merge!(:media_id => media_id)
        return send_request(options)
      end ## end function
      
      
      def setTitle(action_name , media_id  , title ,options = {})
        setup_what_how(action_name , options)
        options.merge!(:media_id => media_id)
        options.merge!(:title => CGI.escape(title))
        return send_request(options)
      end
      
      def setCaption(action_name,media_id  , caption ,options = {})
        setup_what_how(action_name , options)
        options.merge!(:media_id => media_id)
        options.merge!(:caption => CGI.escape(caption))
        return send_request(options)
      end
      
      def setFavorite(action_name, media_id  , favorite = 'yes' ,options = {})
        setup_what_how(action_name , options)
        options.merge!(:media_id => media_id)
        options.merge!(:favorite => favorite)
        return send_request(options)
      end
      
      def addTags(action_name, media_id  , tags  ,options = {})
        setup_what_how(action_name , options)
        options.merge!(:media_id => media_id)
        options.merge!(:tags => CGI.escape(tags))
        return send_request(options)
      end
      
      def removeTag(action_name, media_id  , tag  ,options = {})
        setup_what_how(action_name , options)
        options.merge!(:media_id => media_id)
        options.merge!(:tag => CGI.escape(tag))
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
        options.merge!(:what => action_name)
        options.merge!(:how => 'xml') unless options.has_key?(:how)
      end
      
      
    end ## end class
  end## end advanced
end ## end ikbis