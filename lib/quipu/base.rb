require 'json_api_client'

module Quipu
  class Base < JsonApiClient::Resource
    def self.setup
      self.site = Quipu.config.base_url

      connection do |connection|
        connection.use FaradayMiddleware::OAuth2, Quipu.token
        connection.use Faraday::Response::Logger
      end
    end
  end
end

