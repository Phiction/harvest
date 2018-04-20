module Harvest

  class Error < StandardError
    # @return [Integer]
    attr_reader :code

    # Raised when Harvest returns a 4xx HTTP status code
    ClientError = Class.new(self)

    # Raised when Harvest returns the HTTP status code 400
    BadRequest = Class.new(ClientError)

    # Raised when Harvest returns the HTTP status code 401
    Unauthorized = Class.new(ClientError)

    # Raised when Harvest returns the HTTP status code 403
    Forbidden = Class.new(ClientError)

    # Raised when Harvest returns the HTTP status code 413
    RequestEntityTooLarge = Class.new(ClientError)

    # Raised when Harvest returns the HTTP status code 404
    NotFound = Class.new(ClientError)

    # Raised when Harvest returns the HTTP status code 406
    NotAcceptable = Class.new(ClientError)

    # Raised when Harvest returns the HTTP status code 422
    UnprocessableEntity = Class.new(ClientError)

    # Raised when Harvest returns the HTTP status code 429
    TooManyRequests = Class.new(ClientError)

    # Raised when Harvest returns a 5xx HTTP status code
    ServerError = Class.new(self)

    # Raised when Harvest returns the HTTP status code 500
    InternalServerError = Class.new(ServerError)

    # Raised when Harvest returns the HTTP status code 502
    BadGateway = Class.new(ServerError)

    # Raised when Harvest returns the HTTP status code 503
    ServiceUnavailable = Class.new(ServerError)

    # Raised when Harvest returns the HTTP status code 504
    GatewayTimeout = Class.new(ServerError)

    ERRORS = {
      400 => Harvest::Error::BadRequest,
      401 => Harvest::Error::Unauthorized,
      403 => Harvest::Error::Forbidden,
      404 => Harvest::Error::NotFound,
      406 => Harvest::Error::NotAcceptable,
      413 => Harvest::Error::RequestEntityTooLarge,
      422 => Harvest::Error::UnprocessableEntity,
      429 => Harvest::Error::TooManyRequests,
      500 => Harvest::Error::InternalServerError,
      502 => Harvest::Error::BadGateway,
      503 => Harvest::Error::ServiceUnavailable,
      504 => Harvest::Error::GatewayTimeout,
    }.freeze

    class << self
      include Harvest::Utils

      # # Create a new error from an HTTP response
      # #
      # # @param body [String]
      # # @param headers [Hash]
      # # @return [Harvest::Error]
      # def from_response(body, headers)
      #   message, code = parse_error(body)
      #   new(message, headers, code)
      # end

    private

    #   def parse_error(body)
    #     if body.nil? || body.empty?
    #       ['', nil]
    #     elsif body[:error]
    #       [body[:error], nil]
    #     elsif body[:errors]
    #       extract_message_from_errors(body)
    #     end
    #   end
    #
    #   def extract_message_from_errors(body)
    #     first = Array(body[:errors]).first
    #     if first.is_a?(Hash)
    #       [first[:message].chomp, first[:code]]
    #     else
    #       [first.chomp, nil]
    #     end
    #   end
    end

    # Initializes a new Error object
    #
    # @param message [Exception, String]
    # @param rate_limit [Hash]
    # @param code [Integer]
    # @return [Harvest::Error]
    def initialize(message = '', rate_limit = {}, code = nil)
      super(message)
      @code = code
    end
  end
end
