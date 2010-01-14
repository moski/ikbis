require 'open-uri'
require 'net/http'
require 'yaml'
require 'cgi'
require 'net/http/post/multipart'
module Ikbis
  module Advanced
    class Upload < Ikbis::Advanced::Base
    
      class CouldNotUpload < Exception; end
      class CouldNotAuthenticate < CouldNotUpload; end
      class InvalidUploadFile < CouldNotUpload; end
      class InvalidMediaType < Exception; end
      
      #######################################################
      # Set the class extention string for this class.
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/19/2009
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      def initialize
       @class_extention = "ikbis.upload"
       super ### call the media initialize function.
      end

      #######################################################
      # Sends a multipart/form POST request to the server
      # containing all the required fields for uploading media.
      #
      # It made no sense for this method to follow its siblings behaviour
      # by delegating a send request to Ikbis::Advanced::Base module
      # with the req params, like the other modules are doing since this
      # request is handled by Net::HTTP and NOT HTTParty.
      #
      # The uploaded file is being parsed into a multi-part/form compatible
      # request object by the gem `multipart-post' by Nick Sieger, cheers
      # to him for making this an easy task.
      #
      # Params:
      #   * string file_path => 
      #       must either be a full path or a relative one to the upload file
      #   * hash options
      #    {
      #       * string :title => media title
      #       * string :caption => media caption, defaults to title if not specified
      #       * string enum :type => !"media"|"image"|"video"
      #       * string :tags => space delimited media tag(s)
      #       * string enum :permission => !"public"|"private"|"shared"
      #     }
      #   `!' implies default value
      #   note: ALL parameters are REQUIRED
      #
      # Usage ex:
      #   uploader = Ikbis::Advanced::Uploader.new # must create an object since OAuth is required
      #   uploader.oauth_authentication("ikbis.yml")
      #   uploader.upload(
      #     "http://www.mydomain.com/foo.png", 
      #     { 
      #       :title => "FooBAR", 
      #       :caption => "FooBAR Cap'n", 
      #       :tags => "hello world", 
      #       :permission => "public"
      #      })
      ######################
      # @Created : Jan/19/2009
      # @LastRefactor : Jan/13/2010
      # @Author  : Monther Abushaikh <abushaikh@gmail.com>
      #######################################################
      IMAGE = "image"
      VIDEO = "video"
      MEDIA = "media"
      @@image_types = [ "jpg", "jpeg", "png", "svg", "gif", "bmp" ]
      @@video_types = [ "flv", "wmv", "avi", "mpeg", "3gp", "3g2", "asf", "swf", "mpg", "rm", "3gpp", "mp4", "asp", "mov" ]

      def uploadFile(file_path, options)
        puts "|------------------------ Uploading ------------------------|"
        begin                  
          # open file for uploading
          begin
            file = File.new(file_path)
          rescue
            raise InvalidUploadFile
          end
           
          url = URI.parse('http://localhost:3000/api/medias')

          puts "| Initiating POST request to `#{url.request_uri}'"
          req = Net::HTTP::Post.new(url.request_uri)

          puts "| Constructing File object"
          req = Net::HTTP::Post::Multipart.new url.path, 
            { "file" => UploadIO.new(file, mime_type(file), file.path),
              "title" => options[:title], 
              "caption" => options[:caption], 
              "type" => type(file), 
              "tags" => options[:tags], 
              "permission" => options[:permission]
            }

          puts "| Authenticating..."
          begin
            @consumer.sign!(req, @access_token)
          rescue
            raise CouldNotAuthenticate
          end

          puts "| Initiating connection with `#{url.host}:#{url.port}'"
          res = ""
          
          Net::HTTP.new(url.host, url.port).start do |http| 
            print "| Processing request..."
            res = http.request(req)
            print " done!\n"
          end
        
          puts "| Upload request sent successfully:"
          puts "|   Request URI -> #{url.request_uri}"
          puts "|   Response -> #{res}"

        rescue InvalidMediaType
          print "|   File format not supported. Supported types: "
          print "\n|   Images => "
          print @@image_types.join(", ")
          print "\n|   Videos => "
          print @@video_types.join(", ")
          print "\n"     
        rescue CouldNotAuthenticate
            puts "|  Error while authenticating, have you run oauth_authenticate() ?"
        rescue InvalidUploadFile
            puts "| An error occured processing the file you input, please make sure the file is valid."
        rescue
          puts "| Upload failed with `#{$!}'\n"
          raise CouldNotUpload
        end
        
        puts "|------------------------ --------- ------------------------|"
                
      end

      private
       
      # quick and dirty method for determining mime type of uploaded file
      def mime_type(file)
        case 
          when file =~ /\.jpg/ then 'image/jpg'
          when file =~ /\.gif$/ then 'image/gif'
          when file =~ /\.png$/ then 'image/png'
          else 'application/octet-stream'
        end
      end
      
      def type(file)
        ext = File.extname(file.path).gsub(".", "")

        return IMAGE if @@image_types.include?(ext)
        return VIDEO if @@video_types.include?(ext) 

        raise InvalidMediaType
      end
  
    end ## end class
  end ## end Advanced
end ## end ikbis
