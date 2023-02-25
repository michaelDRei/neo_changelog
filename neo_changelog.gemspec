require_relative "lib/neo_changelog/version"

Gem::Specification.new do |s|
  s.name = "neo_changelog".freeze
  s.version = NeoChangelog::Version::VERSION
  s.authors = "A. Michael".freeze
  s.email = "michael.alves@neomed.tech".freeze
  s.summary = "Made to resolve changelog conflicts".freeze
  s.homepage    = "https://gitlab.com/neomed/backend/changelog"
  s.license     = "MIT"

  s.files = [
    "Gemfile",
    "Rakefile.rb",
    "README.md",
    "lib/neo_changelog/changelog.rb",
    "lib/neo_changelog/neo_changelog.rb",
    "lib/neo_changelog/task.rb",
    "lib/neo_changelog/config.rb",
    "lib/neo_changelog/utils.rb",
    "lib/neo_changelog/directory.rb",
    "lib/neo_changelog/version.rb",
    "neo_changelog.gemspec"
  ]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2".freeze)

  s.require_paths = ["lib"]

  s.executables = "neo_changelog"

  s.add_development_dependency "rake", "~> 13.0", ">= 13.0.0"

  s.add_runtime_dependency "rake", "~> 13.0", ">= 13.0.0"
end
