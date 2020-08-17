module Freshdesk
  class Contact < FreshdeskObject
    class << self
      def create(params: {})
        response = new('/contacts').resource(params: params).post
        set_attrs_from_response(response)
      end

      def retrieve(id:, query: '')
        response = new("/contacts/#{id}#{query}").resource(id: id).get
        set_attrs_from_response(response)
      end

      def list(query: '')
        new("/contacts#{query}").resource.get
      end

      def update(id:, params: {})
        new("/contacts/#{id}").resource(id: id, params: params).put
      end

      def delete(id:)
        new("/contacts/#{id}").resource(id: id).delete
      end

      def list_all_fields
        new('/contacts_fields').resource.get
      end
    end
  end
end
