# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Xavier Shay"]
  gem.email         = ["contact@xaviershay.com"]
  gem.description   =
    %q{Mount the Consul KV store as a filesystem}
  gem.summary       = %q{
    Fuse adapter for Consul KV store.
  }
  gem.homepage      = "http://github.com/xaviershay/consul-fs"

  gem.executables   = []
  gem.required_ruby_version = '>= 2.1.2'
  gem.files         = Dir.glob("{spec,lib}/**/*.rb") + %w(
                        README.md
                        consul-fs.gemspec
                      )
  gem.test_files    = Dir.glob("spec/**/*.rb")
  gem.name          = "consul-fs"
  gem.require_paths = ["lib"]
  gem.bindir        = "bin"
  gem.executables  << "consul-fs"
  gem.license       = "Apache 2.0"
  gem.version       = '0.1.0'
  gem.has_rdoc      = false
  gem.add_dependency 'rfusefs'
  gem.add_dependency 'consul-client'
end
