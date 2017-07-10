# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sbi/security/version"

Gem::Specification.new do |spec|
  spec.name          = "sbi-security"
  spec.version       = Sbi::Security::VERSION
  spec.authors       = ["camelmasa"]
  spec.email         = ["camelmasa@gmail.com"]

  spec.summary       = %q{SBI Security client}
  spec.description   = %q{SBI Security client}
  spec.homepage      = "https://github.com/camelmasa/sbi-security"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "capybara", "~> 2.14"
  spec.add_dependency "selenium-webdriver", "~> 3.4"
  spec.add_dependency "virtus", "~> 1.0"
  spec.add_dependency "terminal-table", "~> 1.8"
  spec.add_dependency "colorize", "~> 0.8"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
