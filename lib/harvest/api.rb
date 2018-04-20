require 'harvest/api/clients'
require 'harvest/api/users'

module Harvest
  module API
    include Harvest::API::Clients
    include Harvest::API::Users
  end
end
