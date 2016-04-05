require 'quipu-api/oauth'

module QuipuApi
  extend OAuth

  DEFAULT_BASE_URL = 'http://getquipu.dev:3000'

  Configuration = Struct.new(:mode, :base_url, :client_id, :client_secret)

  module_function

  def config(&block)
    @config ||= Configuration.new
    @config.mode ||= :ecommerce
    @config.base_url ||= DEFAULT_BASE_URL
    yield @config if block

    @config
  end
end
