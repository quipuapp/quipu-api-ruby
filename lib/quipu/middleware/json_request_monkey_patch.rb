module JsonApiClient
  module Middleware
    class JsonRequest < Faraday::Middleware
      def call(environment)
        environment[:request_headers]["Content-Type"] = 'application/vnd.quipu.v1+json'
        environment[:request_headers]["Accept"] = 'application/vnd.quipu.v1+json'
        @app.call(environment)
      end
    end
  end
end
