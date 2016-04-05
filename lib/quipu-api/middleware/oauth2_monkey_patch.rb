module FaradayMiddleware
  class OAuth2 < Faraday::Middleware
    def call(env)
      params = { param_name => @token }.update query_params(env[:url])
      token = params[param_name]

      if token.respond_to?(:empty?) && !token.empty?
        env[:url].query = build_query params
        env[:request_headers][AUTH_HEADER] ||= %(Bearer #{token})
      end

      @app.call env
    end
  end
end
