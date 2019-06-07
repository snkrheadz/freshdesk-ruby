module Freshdesk
  class Ticket < FreshdeskObject
    class << self
      def create_a_ticket(params: {})
        new("/tickets").resource(params: params).post
      end

      def create_an_outbound_email(params: {})
        new("/tickets/outbound_email").resource(params: params).post
      end

      def view_a_ticket(id:, query: "")
        new("/tickets/#{id}#{query}").resource(id: id).get
      end

      def list_all_tickets(query: "")
        new("/tickets#{query}").resource.get
      end

      def update_a_ticket(id:, params: {})
        new("/tickets/#{id}").resource(id: id, params: params).put
      end

      def delete_a_ticket(id:)
        new("/tickets/#{id}").resource(id: id).delete
      end

      def restore_a_ticket(id:)
        new("/tickets/#{id}/restore").resource(id: id).put
      end

      def list_all_ticket_fields
        new("/ticket_fields").resource.get
      end

      def list_all_conversations_of_a_ticket(id:)
        new("/tickets/#{id}/conversations").resource(id: id).get
      end

      def list_all_time_entries_of_a_ticket(id:)
        new("/tickets/#{id}/time_entries").resource(id: id).get
      end

      def list_all_satisfaction_ratings_of_a_ticket(ticket_id:)
        new("/tickets/#{ticket_id}/satisfaction_ratings").resource.get
      end

      def search_tickets(query: "")
        new("/search/tickets#{query}").resource.get
      end
    end
  end
end
