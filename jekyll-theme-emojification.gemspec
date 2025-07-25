# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-emojification"
  spec.version       = "1.0.0"
  spec.authors       = ["Michael Nordmeyer"]
  spec.email         = ["michaelnordmeyer@users.noreply.github.com"]

  spec.summary       = "A simple and minimal single-author theme with configurable big emoji as the header link, and configurable background colors, which can be chosen for each post or page"
  spec.homepage      = "https://github.com/michaelnordmeyer/jekyll-theme-emojification"
  spec.license       = "MIT"

  spec.metadata["plugin_type"] = "theme"

  spec.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(assets|_data|_layouts|_includes|_sass|(CODE_OF_CONDUCT|LICENSE|README)((\.(txt|md|markdown)|$))|_config\.yml)!i)
  end

  spec.required_ruby_version = '>= 2.7.0' # according to jekyll.gemspec
  spec.required_rubygems_version = ">= 3.4.0"

  spec.add_runtime_dependency "jekyll", ">= 3.10.0", "< 5.0"
  spec.add_runtime_dependency "jekyll-include-cache", "~> 0.2"
  spec.add_runtime_dependency "jekyll-titleize", "~> 0.1"

  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "rake", "~> 13.0"
end
