require 'json_api_client'

module QuipuApi
  class Base < JsonApiClient::Resource
    self.site = QuipuApi.config.base_url

    def self.setup_middleware
      connection do |connection|
        connection.use FaradayMiddleware::OAuth2, QuipuApi.get_token(:client_credentials)
      end
    end
  end
end

