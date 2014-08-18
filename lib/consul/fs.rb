require 'rfusefs'
require 'consul/client'
require 'base64'

module Consul
  module FS
    class Dir
      attr_reader :consul

      def initialize
        @consul = Consul::Client.v1.http
      end

      def contents(path)
        path += "/" unless path.end_with?("/")
        consul.get("/kv#{path}?recurse&separator=/&keys")
          .map {|x| x[path.length-1..-1] }
      end

      def file?(path)
        consul.get("/kv#{path}?keys")
        true
      rescue Consul::Client::ResponseException
        false
      end

      def directory?(path)
        consul.get("/kv#{path}?keys").any? {|x| x.include?("#{path[1..-1]}/") }
      rescue Consul::Client::ResponseException
        false
      end

      def read_file(path)
        Base64.decode64(consul.get("/kv#{path}")[0]["Value"])
      rescue Consul::Client::ResponseException
        ""
      end
    end

    def self.start
      FuseFS.main do |options|
        Dir.new
      end
    end
  end
end
