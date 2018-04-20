require 'net/http'
require 'uri'
require 'json'
require 'harvest/error'
require 'harvest/headers'
require 'harvest/utils'

module Harvest
  module API
    class Request
      include Harvest::Utils
      BASE_URL = 'https://api.harvestapp.com/v2'.freeze
      attr_accessor :client, :headers, :options, :path, :rate_limit, :request_method, :uri

      # @param client [Harvest::Client]
      # @param request_method [String, Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Harvest::API::Request]
      def initialize(client, request_method, path, options = {})
        @client = client
        @uri = URI.parse(path.start_with?('http') ? path : BASE_URL + path)
        @request_method = request_method
        @path = uri.path
        @options = options
      end

      def perform
        response = case @request_method # TODO: cleanup
        when :get
          perform_get
        when :post
          perform_post
        when :patch
          perform_patch
        when :delete
          perform_delete
        else
          # raise some sort of error
          Harvest::Error::BadRequest.new(body, code)
        end

        fail_or_return_parsed_body(response.code, response.body)
      end

      def perform_get # TODO: cleanup
        @uri.query = URI.encode_www_form(clean_options)

        request = Net::HTTP::Get.new(@uri)
        request['Authorization'] = "Bearer #{@client.access_token}"
        request['Harvest-Account-Id'] = @client.account_id

        Net::HTTP.start(@uri.hostname, @uri.port, use_ssl: true) do |http|
          http.request(request)
        end
      end

      def perform_post # TODO: cleanup
        Net::HTTP.start(@uri.host, @uri.port, use_ssl: true) do |http|
          request = Net::HTTP::Post.new @uri
          request['Authorization'] = "Bearer #{@client.access_token}"
          request['Harvest-Account-Id'] = @client.account_id
          request.set_form_data(clean_options)

          http.request request
        end
      end

      def perform_patch # TODO: cleanup
        Net::HTTP.start(@uri.host, @uri.port, use_ssl: true) do |http|
          request = Net::HTTP::Patch.new @uri
          request['Authorization'] = "Bearer #{@client.access_token}"
          request['Harvest-Account-Id'] = @client.account_id
          request.set_form_data(clean_options)

          http.request request
        end
      end

      def perform_delete # TODO: cleanup
        Net::HTTP.start(@uri.host, @uri.port, use_ssl: true) do |http|
          request = Net::HTTP::Delete.new @uri
          request['Authorization'] = "Bearer #{@client.access_token}"
          request['Harvest-Account-Id'] = @client.account_id
          request.set_form_data(clean_options)

          http.request request
        end
      end

    private

      def fail_or_return_parsed_body(code, body)
        error = Harvest::Error::ERRORS[code.to_i]
        raise(error) if error

        symbolize_keys!(JSON.parse(body))
      end

      def clean_options
        @options.reject{|k,v| v.nil? || (!v.is_a?(Integer) && v.to_s.empty?) }
      end

      # TODO: see if needed
      def symbolize_keys!(object)
        if object.is_a?(Array)
          object.each_with_index do |val, index|
            object[index] = symbolize_keys!(val)
          end
        elsif object.is_a?(Hash)
          object.keys.each do |key|
            object[key.to_sym] = symbolize_keys!(object.delete(key))
          end
        end
        object
      end

    end
  end
end
