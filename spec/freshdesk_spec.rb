require "spec_helper"

def setup_config
  Freshdesk.domain = "domain"
  Freshdesk.user_name_or_api_key = "api_key"
  Freshdesk.password_or_x = "X"
end

RSpec.describe Freshdesk do
  describe "Version" do
    it "has a version number" do
      expect(Freshdesk::VERSION).not_to be nil
    end

    it "returns version number 0.1.0" do
      expect(Freshdesk::VERSION).to eq("0.1.0")
    end
  end

  describe "Config" do
    it "raises runtime error without domain" do
      expect{ Freshdesk.domain }.to raise_error(RuntimeError)
    end

    it "returns domain" do
      Freshdesk.domain = "domain"
      expect(Freshdesk.domain).to eq("domain")
    end

    it "raises runtime error without user_name_or_api_key" do
      expect{ Freshdesk.user_name_or_api_key }.to raise_error(RuntimeError)
    end

    it "returns api_key_string" do
      Freshdesk.user_name_or_api_key = "api_key_string"
      expect(Freshdesk.user_name_or_api_key).to eq("api_key_string")
    end

    it "raises runtime error without password_or_x" do
      expect{ Freshdesk.password_or_x }.to raise_error(RuntimeError)
    end

    it "returns X" do
      Freshdesk.password_or_x = "X"
      expect(Freshdesk.password_or_x).to eq("X")
    end

    it "returns v2" do
      Freshdesk.api_version = "v2"
      expect(Freshdesk.api_version).to eq("v2")
    end
  end

  describe "FreshdeskObject" do
    before do
      @freshdesk_object = Freshdesk::FreshdeskObject.new("/ticket")
    end

    it "returns endpoint" do
      expect(@freshdesk_object.endpoint).to eq("/ticket")
    end

    it "returns a resource instance" do
      expect(@freshdesk_object.resource).to be_a_kind_of(Freshdesk::Resource)
    end
  end

  describe "Resource" do
    before do
      setup_config
      @params = {
        status: 2,
        priority: 1,
        description: "hello description",
        subject: "hello, subject",
      }
      @resource = Freshdesk::Resource.new("/ticket", @params)
    end

    it "returns endpoint" do
      expect(@resource.endpoint).to eq("/ticket")
    end

    it "returns params" do
      expect(@resource.params).to eq(@params)
    end

    it "returns api url" do
      expect(@resource.api_url).to eq("https://domain.freshdesk.com/api/v2/ticket")
    end

    it "returns json string" do
      expect(@resource.json_payload).to eq(@params.to_json)
      expect(@resource.json_payload).to be_a_kind_of(String)
    end

    it "raises rest client exception error on post method with invalid configurations" do
      expect{ @resource.post }.to raise_error(RestClient::Exception)
    end

    it "raises rest client exception error on get method with invalid configurations" do
      expect{ @resource.get }.to raise_error(RestClient::Exception)
    end
  end

  # describe "Ticket" do
  #   before do
  #     Freshdesk.domain = "replace with your domain"
  #     Freshdesk.user_name_or_api_key = "replace with your api key"
  #     Freshdesk.password_or_x = "X"
  #   end
  #
  #   it "creates a ticket" do
  #     params = {
  #       status: 2,
  #       priority: 1,
  #       description: "test ticket creation with attachments",
  #       subject: "new ticket sample #{Time.now}",
  #       cc_emails: ["test+1@example.com"],
  #       email: "test@example.com",
  #     }
  #     Freshdesk::Ticket.create_a_ticket(params: params)
  #   end
  #
  #   it "returns a ticket" do
  #     Freshdesk::Ticket.view_a_ticket(id: 19)
  #   end
  #
  #   it "lists all tickets" do
  #     Freshdesk::Ticket.list_all_tickets
  #   end
  #
  #   it "updates a ticket" do
  #     params = {
  #       subject: "new ticket sample #{Time.now}",
  #     }
  #     Freshdesk::Ticket.update_a_ticket(id: 19, params: params)
  #   end
  #
  #   it "deletes a ticket" do
  #     Freshdesk::Ticket.delete_a_ticket(id: 19)
  #   end
  #
  #   it "restores a ticket" do
  #     Freshdesk::Ticket.restore_a_ticket(id: 19)
  #   end
  #
  #   it "lists all ticket fields" do
  #     Freshdesk::Ticket.list_all_ticket_fields
  #   end
  #   it "lists all conversations of a ticket" do
  #     Freshdesk::Ticket.list_all_conversations_of_a_ticket(id: 19)
  #   end
  #   it "lists all time entries of a ticket" do
  #     Freshdesk::Ticket.list_all_time_entries_of_a_ticket(id: 19)
  #   end
  #   it "lists all satisfaction ratings of a ticket" do
  #     Freshdesk::Ticket.list_all_satisfaction_ratings_of_a_ticket(ticket_id: 1)
  #   end
  # end
end
