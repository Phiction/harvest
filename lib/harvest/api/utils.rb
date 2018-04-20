require 'harvest/api/request' # TODO: cleanup

module Harvest
  module API
    module Utils

      def perform_request(request_method, path, options = {})
        Harvest::API::Request.new(self, request_method, path, options).perform
      end

      def perform_get(path, options = {})
        perform_request(:get, path, options)
      end

      def perform_get_object(klass, path, options = {})
        result = perform_get(path, options)
        klass.new(result, options, self)
      end

      def perform_get_objects(klass, path, options = {})
        results = perform_get(path, options)

        results.values[0].collect do |item|
          klass.new(item, options, self)
        end
      end

      def perform_post(path, options = {})
        perform_request(:post, path, options)
      end

      def perform_post_object(klass, path, options = {})
        result = perform_post(path, options)
        klass.new(result, options, self)
      end

      def perform_patch(path, options = {})
        perform_request(:patch, path, options)
      end

      def perform_patch_object(klass, path, options = {})
        result = perform_patch(path, options)
        klass.new(result, options, self)
      end

      def perform_delete(path, options = {})
        perform_request(:delete, path, options)
      end

      def perform_delete_object(klass, path, options = {})
        result = perform_delete(path, options)
        klass.new(result, options, self)
      end

    end
  end
end
