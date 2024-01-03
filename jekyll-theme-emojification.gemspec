# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-emojification"
  spec.version       = "1.0.0"
  spec.authors       = ["Michael Nordmeyer"]
  spec.email         = ["michaelnordmeyer@users.noreply.github.com"]

  spec.summary       = "A simple and minimal single-author theme with configurable big emoji as header links, and configurable background colors, which can be chosen for each post or page"
  spec.homepage      = "https://github.com/michaelnordmeyer/jekyll-theme-emojification"
  spec.license       = "MIT"

  spec.metadata["plugin_type"] = "theme"
  
  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", ">= 3.9.3", "< 5.0"
  spec.add_runtime_dependency "jekyll-include-cache", "~> 0.2.1"
end
