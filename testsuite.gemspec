# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markdown-testsuite/version'

Gem::Specification.new do |spec|
  spec.name          = "markdown-testsuite"
  spec.version       = Markdown::Testsuite::VERSION
  spec.authors       = ["Dave Kinkead"]
  spec.email         = ["dave@kinkead.com.au"]
  spec.description   = %q{A testsuite for markdown}
  spec.summary       = %q{Access the markdown testsuite programatically}
  spec.homepage      = "https://github.com/davekinkead/markdown-testsuite"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|specs|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
