require 'harvest/base'

module Harvest
  class Client < Harvest::Base
    attr_reader :id, :name, :is_active, :address, :currency, :created_at, :updated_at

    def initialize(attributes={}, query_options={}, connection=nil)
      @id = attributes[:id]
      @name = attributes[:name]
      @is_active = attributes[:is_active]
      @address = attributes[:address]
      @currency = attributes[:currency]
      @created_at = attributes[:created_at]
      @updated_at = attributes[:updated_at]
    end

  end
end
