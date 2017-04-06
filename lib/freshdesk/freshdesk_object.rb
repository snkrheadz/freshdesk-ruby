module Freshdesk
  class FreshdeskObject
    def initialize(endpoint)
      @endpoint = endpoint
    end

    attr_reader :endpoint

    def resource(params: {}, id: nil)
      Freshdesk::Resource.new(endpoint, params, id)
    end
  end
end
