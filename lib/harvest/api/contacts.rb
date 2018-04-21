require 'harvest/api/request'
require 'harvest/api/utils'
require 'harvest/contact'

module Harvest
  module API
    module Contacts
      include Harvest::API::Utils

      def contacts(options={})
        perform_get_objects(Harvest::Contact, '/contacts', options)
      end

      def contact(id, options={})
        perform_get_object(Harvest::Contact, "/contacts/#{id}", options)
      end

      def contact_create(options={})
        perform_post_object(Harvest::Contact, '/contacts', options)
      end

      def contact_update(id, options={})
        perform_patch_object(Harvest::Contact, "/contacts/#{id}", options)
      end

      def contact_delete(id, options={})
        perform_delete_object(Harvest::Contact, "/contacts/#{id}", options)
      end

    end
  end
end
