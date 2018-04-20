require 'addressable/uri'

require 'harvest/utils'

module Harvest
  class Base
    attr_reader :connection, :query_options

    def initialize(obj_hash = {}, query_options = {}, connection = nil)
      @connection = connection
      @query_options = query_options
    end

  end
end
