require 'oauth2'

module QuipuApi
  module OAuth
    def get_token(mode)
      raise 'Unconfigured' unless auth_configured?

      case mode
      when :client_credentials
        client.client_credentials.get_token.token
      end
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
