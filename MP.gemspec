# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "MP"
  spec.version       = "0.1.0"
  spec.authors       = ["pmaarks"]
  spec.email         = ["pms6413@gmail.com"]

  spec.summary       = "test"
  spec.homepage      = "http://website.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3"
end
