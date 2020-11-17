require_relative "lib/tomo/plugin/cron/version"

Gem::Specification.new do |spec|
  spec.name = "tomo-plugin-cron"
  spec.version = Tomo::Plugin::Cron::VERSION
  spec.authors = ["Muhammad Usman"]
  spec.email = ["uxman.sherwani@gmail.com"]

  spec.summary = "cron tasks for tomo"
  spec.homepage = "https://github.com/uxxman/tomo-plugin-cron"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/uxxman/tomo-plugin-cron/issues",
    "changelog_uri" => "https://github.com/uxxman/tomo-plugin-cron/releases",
    "source_code_uri" => "https://github.com/uxxman/tomo-plugin-cron",
    "homepage_uri" => spec.homepage
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob(%w[LICENSE.txt README.md {exe,lib}/**/*]).reject { |f| File.directory?(f) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tomo", "~> 1.0"
end
