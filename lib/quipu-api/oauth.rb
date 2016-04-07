require 'oauth2'

module QuipuApi
  MissingAuthInfo = Class.new(StandardError)

  module OAuth
    def get_token
      raise MissingAuthInfo unless auth_configured?

      client.client_credentials.get_token.token
    end

    def token
      @config.token ||= get_token
    end

    def refresh_token
      @config.token = get_token
    end

    def auth_configured?
      @config.client_id && @config.client_secret
    end

    def client
      @client ||= OAuth2::Client.new(@config.client_id,
                                     @config.client_secret,
                                     site: @config.base_url)
    end
  end
end
