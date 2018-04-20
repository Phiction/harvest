require 'harvest/api'
require 'harvest/error'
require 'harvest/utils'
require 'harvest/version'

module Harvest
  class Client
    # include Harvest::Utils
    include Harvest::API

    attr_accessor :access_token, :account_id
    attr_writer :user_agent

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Harvest::Api::Client]
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    # @return [String]
    def user_agent
      @user_agent ||= "HarvestGem/#{Harvest::VERSION}"
    end

    # @return [Hash]
    def credentials
      {
        access_token: access_token,
        account_id: account_id
      }
    end

    # @return [Boolean]
    def credentials?
      credentials.values.none? { |v| blank?(v) }
    end

    private

    def blank?(s)
      s.respond_to?(:empty?) ? s.empty? : !s
    end

  end
end
