require 'addressable/uri'

require 'harvest/utils'

module Harvest
  class Base
    attr_reader :client, :query_options

    def initialize(obj_hash = {}, query_options = {}, client = nil)
      @client = client
      @query_options = query_options
    end

  end
end
