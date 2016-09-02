# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csv2schema/version'

Gem::Specification.new do |spec|
  spec.name          = "csv2schema"
  spec.version       = Csv2schema::VERSION
  spec.authors       = ["pezholio"]
  spec.email         = ["pezholio@gmail.com"]

  spec.summary       = "Generate a JSON table schema from a CSV file"
  spec.homepage      = "https://github.com/theodi/csv2schema"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "csvlint", "~> 0.3.2"
  spec.add_dependency "thor", "~> 0.19.1"
  spec.add_dependency "colorize", "~> 0.8.1"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.4"
end
