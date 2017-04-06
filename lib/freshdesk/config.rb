module Freshdesk
  class << self
    attr_accessor :domain, :user_name_or_api_key, :password_or_x, :api_version

    def domain
      get_key :domain
    end

    def user_name_or_api_key
      get_key :user_name_or_api_key
    end

    def password_or_x
      get_key :password_or_x
    end

    def api_version
      "v2"
    end

    def get_key(key)
      instance_variable_get("@#{key}") || raise("Set Freshdesk.#{key} to use this feature")
    end
  end
end
