# frozen_string_literal: true

require_relative "lib/unit_manager/version"

Gem::Specification.new do |spec|
  spec.name = "unit_manager"
  spec.version = UnitManager::VERSION
  spec.authors = ["NaoyukiKojima"]
  spec.email = ["programkoji213@gmail.com"]

  spec.summary = "A gem that manages units."
  spec.description = "Manage units easily."
  spec.homepage = "https://github.com/KojimaNaoyuki/unit_manager"
  spec.required_ruby_version = ">= 2.6.0"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "https://github.com/KojimaNaoyuki/unit_manager"
  # spec.metadata["changelog_uri"] = "https://github.com/KojimaNaoyuki/unit_manager"

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
  spec.add_dependency "rake", "~> 13.0"
  spec.add_dependency "activesupport"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-rails"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
