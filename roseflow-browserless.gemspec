# frozen_string_literal: true

require_relative "lib/roseflow/browserless/version"

Gem::Specification.new do |spec|
  spec.name = "roseflow-browserless"
  spec.version = Roseflow::Browserless.gem_version
  spec.authors = ["Lauri Jutila"]
  spec.email = ["git@laurijutila.com"]

  spec.summary = "Browserless API client for Roseflow"
  spec.description = "Browserless API client for Roseflow"
  spec.homepage = "https://github.com/roseflow-ai/roseflow-browserless"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/roseflow-ai/roseflow-browserless"
  spec.metadata["changelog_uri"] = "https://github.com/roseflow-ai/roseflow-browserless/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_dependency "anyway_config"
  spec.add_dependency "async-http-faraday"
  spec.add_dependency "faraday"

  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
