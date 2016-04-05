require 'json_api_client'

module QuipuApi
  class Base < JsonApiClient::Resource
    def self.setup
      self.site = QuipuApi.config.base_url

      connection do |connection|
        connection.use FaradayMiddleware::OAuth2, QuipuApi.get_token(:client_credentials)
        connection.use Faraday::Response::Logger
      end
    end
  end
end

