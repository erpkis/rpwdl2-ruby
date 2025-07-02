# frozen_string_literal: true

require_relative "lib/rpwdl2/version"
Gem::Specification.new do |spec|
  spec.name = "rpwdl2-ruby"
  spec.version = Rpwdl2::VERSION
  spec.authors = ["erpkis"]
  spec.email = ["eryk.kisielewski@dsi24.com"]

  spec.summary = "RPWDL dla ruby"
  spec.description = "RPWDL dla ruby."
  spec.homepage = "https://github.com/erpkis/rpwdl2-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/erpkis/rpwdl2-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/erpkis/rpwdl2-ruby/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  # Dependencies
  spec.add_dependency "sequel", ">= 5.0"
  spec.add_dependency "json", ">= 2.0"
  
  # Development dependencies
  spec.add_development_dependency "bundler", ">= 2.0"
  spec.add_development_dependency "rake", ">= 13.0"
  spec.add_development_dependency "minitest", ">= 5.0"
  spec.add_development_dependency "webmock", ">= 3.0"
  spec.add_development_dependency "vcr", ">= 6.0"
  spec.add_development_dependency "solargraph"
  spec.add_development_dependency "pry"
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
