module Ikbis
  module Advanced
    class Media < Ikbis::Advanced::Base
      
      #######################################################
      # Find all the public method for this class
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      def initialize
        @valid_method  = Ikbis::Advanced::Media.instance_methods(false).collect{|x| x.gsub('media_' , '')}
      end
      
      #######################################################
      # Find all the public method for this class
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      def method_missing(key, *args, &block)
        if @valid_method.include?(key.to_s)                    
          (class << self; self; end).class_eval do
            define_method(key) do |*args|
               args.insert(0,"#{@class_extention}.#{key}")
               send "media_#{key}" , *args
            end
          end
          send "#{key}" , *args
        else
          super
        end
      end ## end method_missing
      
      
      
      
      protected
      def media_getUploadedList(action_name , username , options = {})
        options.merge!(:what => action_name)
        options.merge!(:how => 'xml') unless options.has_key?(:how)
        options.merge!(:username => CGI.escape(username))
        return send_request(options)
      end ## end function.
      
      
      def media_getInfo(action_name ,media_id  , options = {})
        options.merge!(:what => action_name)
        options.merge!(:how => 'xml') unless options.has_key?(:how)
        options.merge!(:media_id => media_id)
        return send_request(options)
      end ## end function
      
      
      def media_getThumbnailUrl(action_name , media_id  , options = {})
        options.merge!(:what => action_name)
        options.merge!(:how => 'xml') unless options.has_key?(:how)
        options.merge!(:media_id => media_id)
        return send_request(options)
      end ## end function
      
      
      def media_setTitle(action_name , media_id  , title ,options = {})
        options.merge!(:what => action_name)
        options.merge!(:how => 'xml') unless options.has_key?(:how)
        options.merge!(:media_id => media_id)
        options.merge!(:title => CGI.escape(title))
        return send_request(options)
      end
      
      def media_setCaption(action_name,media_id  , caption ,options = {})
        options.merge!(:what => action_name)
        options.merge!(:how => 'xml') unless options.has_key?(:how)
        options.merge!(:media_id => media_id)
        options.merge!(:caption => CGI.escape(caption))
        return send_request(options)
      end
      
      
    end ## end class
  end## end advanced
end ## end ikbis