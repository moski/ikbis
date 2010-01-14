require 'rubygems'
require 'httparty'
require 'cgi'
require 'net/http'
require 'net/http/post/multipart'
require 'oauth/consumer'
require 'yaml'

$:.unshift(File.dirname(__FILE__))
require 'ikbis/simple'
require 'ikbis/advanced'

module Ikbis
end
