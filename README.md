# A Ruby API client for Freshdesk API v2

[![Gem Version](https://badge.fury.io/rb/freshdesk-ruby.svg)](https://badge.fury.io/rb/freshdesk-ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "freshdesk-ruby"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freshdesk-ruby

## Usage

A Ruby API client that interfaces with freshdesk.com web service. This client supports regular CRUD operation

It supports following:

- [Tickets](https://developer.freshdesk.com/api/#tickets)

[freshdesk API reference](https://developer.freshdesk.com/api/)

Currently I needed this library to support Tickets APIs to use this api client on a project. I am gonna update with other API supports later. And collaborators are welcome :)

```ruby
require "freshdesk"

Freshdesk.domain = "replace with your domain"
Freshdesk.user_name_or_api_key = "replace with your api key"
Freshdesk.password_or_x = "X"

# creates a ticket
params = {
  status: 2,
  priority: 1,
  description: "test ticket creation with attachments",
  subject: "new ticket sample #{Time.now}",
  cc_emails: ["test+1@example.com"],
  email: "test@example.com",
}
Freshdesk::Ticket.create_a_ticket(params: params)

# returns a ticket
res = Freshdesk::Ticket.view_a_ticket(id: 19)
# Freshdesk::Ticket.singleton_methods(false) return RestClient::Response instance
res.class.name
# => RestClient::Response

res.code
# => 200

response_hash = JSON.parse(res.body)
# => {"cc_emails"=>[], "fwd_emails"=>[], "reply_cc_emails"=>[], "fr_escalated"=>false, "spam"=>false, "email_config_id"=>nil, "group_id"=>nil, "priority"=>1, "requester_id"=>27000314885, "responder_id"=>nil, "source"=>2, "company_id"=>nil, "status"=>2, "subject"=>"new ticket sample 2017-04-06 16:07:20 +0900", "to_emails"=>nil, "product_id"=>nil, "id"=>19, "type"=>nil, "due_by"=>"2017-05-26T09:00:00Z", "fr_due_by"=>"2017-04-07T04:00:00Z", "is_escalated"=>false, "description"=>"<div>test ticket creation with attachments</div>", "description_text"=>"test ticket creation with attachments", "custom_fields"=>{"subcategory"=>nil, "category"=>nil, "featurecomponent"=>nil, "apiplugin"=>nil, "account_country"=>nil, "solution"=>nil}, "created_at"=>"2017-04-06T06:06:42Z", "updated_at"=>"2017-04-06T09:11:32Z", "tags"=>[], "attachments"=>[]}

# lists all tickets
Freshdesk::Ticket.list_all_tickets

# updates a ticket
params = {
  subject: "new ticket sample #{Time.now}",
}
Freshdesk::Ticket.update_a_ticket(id: 19, params: params)

# deletes a ticket
Freshdesk::Ticket.delete_a_ticket(id: 19)

# restores a ticket
Freshdesk::Ticket.restore_a_ticket(id: 19)

# lists all ticket fields
Freshdesk::Ticket.list_all_ticket_fields

# lists all conversations of a ticket
Freshdesk::Ticket.list_all_conversations_of_a_ticket(id: 19)

# lists all time entries of a ticket
Freshdesk::Ticket.list_all_time_entries_of_a_ticket(id: 19)

# lists all satisfaction ratings of a ticket
Freshdesk::Ticket.list_all_satisfaction_ratings_of_a_ticket(ticket_id: 1)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/akinrt/freshdesk-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
