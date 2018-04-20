require 'addressable/uri'

module Harvest
  class Headers
    def initialize(connection, request_method, url, options = {})
      @connection = connection
      @request_method = request_method.to_sym
      @uri = Addressable::URI.parse(url)
      @bearer_token_request = options.delete(:bearer_token_request)
      @options = options
    end

    def bearer_token_request?
      !!@bearer_token_request
    end

    def request_headers
      headers = {}
      headers[:user_agent] = @connection.user_agent
      if bearer_token_request?
        headers[:accept]        = '*/*'
        headers[:authorization] = bearer_token_credentials_auth_header
      else
        headers[:authorization] = auth_header
      end
      headers
    end

  private

    def auth_header
      if @connection.user_token?
        oauth_auth_header.to_s
      else
        @connection.bearer_token = @connection.token unless @connection.bearer_token?
        bearer_auth_header
      end
    end

    # @return [String]
    def bearer_auth_header
      "Bearer #{@connection.bearer_token}"
    end

    # Generates authentication header for a bearer token request
    #
    # @return [String]
    def bearer_token_credentials_auth_header
      "Basic #{Base64.strict_encode64("#{@connection.consumer_key}:#{@connection.consumer_secret}")}"
    end
  end
end
