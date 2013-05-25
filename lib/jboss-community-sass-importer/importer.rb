require 'sass'
require 'sass/importers/base'
require 'net/http'
require 'time'

module Jboss
  module Community
    class SassImporter < ::Sass::Importers::Base 

      def initialize
        @base_uri = 'http://static.jboss.org/'
        ::Sass.load_paths << self unless ::Sass.load_paths.include? self
      end

      def find(uri, options) 
        parsed_uri = URI.parse @base_uri + '/theme/css/bootstrap-community/' + uri
        Net::HTTP.start(parsed_uri.hostname, parsed_uri.port) do |http|
          p http.inspect
          response = http.get parsed_uri.request_uri

          ::Sass::Engine.new response.body, {:importer => self, :filename => parsed_uri.to_s, :syntax => :scss}
        end
      end

      def find_relative(uri, base, options)
        nil
      end

      def extensions
        {'css' => :scss}
      end

      def mtime(uri, options)
        parsed_uri = URI.parse @base_uri + '/theme/css/bootstrap-community/' + uri
        Net::HTTP.start(uri.host, uri.port) do |conn|
          response = http.head parsed_uri.request_uri

          if response.code == '200' && response['Last-Modified']
            Time.parse response['Last-Modified']
          elsif response.code == '200'
            Time.now # We don't a last modified time from the server, use now
          else
            nil
          end
        end
      end

      def key(uri, options)
        ["#{self.class.name}:#{@base_uri}", uri]
      end

      def to_s
        "#{self.class.name}:#{@base_uri}"
      end
    end
  end
end

