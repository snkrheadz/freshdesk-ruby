module Freshdesk
  class Contact < FreshdeskObject
    class << self
      def create_a_contact(params: {})
        response = new("/contacts").resource(params: params).post
        set_attrs_from_response(response)
      end

      def view_a_contact(id:, query: "")
        response = new("/contacts/#{id}#{query}").resource(id: id).get
        set_attrs_from_response(response)
      end

      def list_all_contacts(query: "")
        new("/contacts#{query}").resource.get
      end

      def update_a_contact(id:, params: {})
        new("/contacts/#{id}").resource(id: id, params: params).put
      end

      def delete_a_contact(id:)
        new("/contacts/#{id}").resource(id: id).delete
      end

      def list_all_contact_fields
        new("/contacts_fields").resource.get
      end

    end
  end
end