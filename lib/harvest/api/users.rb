require 'harvest/error'
require 'harvest/api/request'
require 'harvest/api/utils'
require 'harvest/user'
require 'harvest/utils'

module Harvest
  module API
    module Users
      include Harvest::API::Utils
      include Harvest::Utils

      def me(options={})
        perform_get_object(Harvest::User, '/users/me', options)
      end

      def users(options={})
        perform_get_objects(Harvest::User, '/users', options)
      end

      def user(id, options={})
        perform_get_object(Harvest::User, "/users/#{id}", options)
      end

      def user_create(options={})
        perform_post_object(Harvest::User, '/users', options)
      end

      def user_update(id, options={})
        perform_patch_object(Harvest::User, "/users/#{id}", options)
      end

      def user_delete(id, options={})
        perform_delete_object(Harvest::User, "/users/#{id}", options)
      end

    end
  end
end
