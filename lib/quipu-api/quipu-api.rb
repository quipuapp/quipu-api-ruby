require 'quipu-api/oauth'

module QuipuApi
  extend OAuth

  @base_setup_done = false

  DEFAULT_BASE_URL = 'http://getquipu.dev:3000'

  Configuration = Struct.new(:mode, :base_url, :client_id, :client_secret)

  module_function

  def config(&block)
    @config ||= Configuration.new
    @config.mode ||= :ecommerce
    @config.base_url ||= DEFAULT_BASE_URL

    yield @config if block

    if !@base_setup_done && auth_configured?
      @base_setup_done = true
      QuipuApi::Base.setup
    end

    @config
  end
end
