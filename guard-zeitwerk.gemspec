# frozen_string_literal: true

require_relative "lib/guard/zeitwerk/version"

Gem::Specification.new do |spec|
  spec.name = "guard-zeitwerk"
  spec.version = Guard::ZeitwerkGuard::VERSION
  spec.authors = ["Brad Gessler"]
  spec.email = ["bradgessler@gmail.com"]

  spec.summary = "Adds Ruby module to empty files"
  spec.description = "Create an empty file in a Ruby project and guard-zeitwerk will add the module declaration for you."
  spec.homepage = "https://github.com/rubymonolith/guard-zeitwerk"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

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

  # Zeitwerk::Loader#expected_cpath_at was added after version 2.6.8.
  spec.add_dependency "zeitwerk", "> 2.6.8"
  spec.add_dependency "guard", "~> 2.1"
  spec.add_dependency "guard-compat", "~> 1.1"
end
