require 'harvest/api/request'
require 'harvest/api/utils'
require 'harvest/user'

module Harvest
  module API
    module Users
      include Harvest::API::Utils

      def users(options={})
        perform_get_objects(Harvest::User, '/users', options)
      end

      def user(*args)
        options = args.last.is_a?(::Hash) ? args.pop : {} # HACK: ?

        path = args.length == 0 ? '/users/me' : "/users/#{args.first}"
        perform_get_object(Harvest::User, path, options)
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

      def user_project_assignments(*args)
        options = args.last.is_a?(::Hash) ? args.pop : {} # HACK: ?

        path = args.length == 0 ? '/users/me/project_assignments' : "/users/#{args.first}/project_assignments"
        perform_get_objects(Harvest::ProjectAssignment, path, options)
      end

    end
  end
end
