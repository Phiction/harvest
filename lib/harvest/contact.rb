require 'harvest/base'

module Harvest
  class Contact < Harvest::Base
    attr_reader :id, :client, :title, :first_name, :last_name, :email, :phone_office, :phone_mobile, :fax, :created_at, :updated_at

    def initialize(attributes={}, query_options={}, connection=nil)
      @id = attributes[:id]
      @client = attributes[:client]
      @title = attributes[:title]
      @first_name = attributes[:first_name]
      @last_name = attributes[:last_name]
      @email = attributes[:email]
      @phone_office = attributes[:phone_office]
      @phone_mobile = attributes[:phone_mobile]
      @fax = attributes[:fax]
      @created_at = attributes[:created_at]
      @updated_at = attributes[:updated_at]
    end

  end
end
