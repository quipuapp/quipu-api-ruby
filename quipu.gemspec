$:.push File.expand_path('../lib', __FILE__)
require 'quipu/version'

Gem::Specification.new do |s|
  s.name     = 'quipu'
  s.version  = Quipu::VERSION
  s.authors  = ['Oriol Francès']
  s.email    = ['oriol@getquipu.com']
  s.summary  = 'Ruby client for the official Quipu API'
  s.homepage = 'https://getquipu.com'
  s.license  = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_dependency "json_api_client", '~> 1.1'
  s.add_dependency "oauth2", '~> 1.1'
end
