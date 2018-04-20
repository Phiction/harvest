require 'harvest/api/request'
require 'harvest/api/utils'
require 'harvest/client'

module Harvest
  module API
    module Clients
      include Harvest::API::Utils

      def clients(options={})
        perform_get_objects(Harvest::Client, '/clients', options)
      end

      def client(id, options={})
        perform_get_object(Harvest::Client, "/clients/#{id}", options)
      end

      def client_create(options={})
        perform_post_object(Harvest::Client, '/clients', options)
      end

      def client_update(id, options={})
        perform_patch_object(Harvest::Client, "/clients/#{id}", options)
      end

      def client_delete(id, options={})
        perform_delete_object(Harvest::Client, "/clients/#{id}", options)
      end

    end
  end
end
