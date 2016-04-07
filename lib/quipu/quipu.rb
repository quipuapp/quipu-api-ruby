require 'quipu/oauth'

module Quipu
  extend OAuth

  @base_setup_done = false

  DEFAULT_BASE_URL = 'https://getquipu.com'

  Configuration = Struct.new(:mode, :base_url, :client_id, :client_secret, :token)

  module_function

  def config(&block)
    @config ||= Configuration.new
    @config.mode ||= :ecommerce
    @config.base_url ||= DEFAULT_BASE_URL

    yield @config if block

    if !@base_setup_done && auth_configured?
      @base_setup_done = true
      Quipu::Base.setup
    end

    @config
  end
end
