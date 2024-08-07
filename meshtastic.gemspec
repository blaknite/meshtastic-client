# frozen_string_literal: true

require_relative "lib/meshtastic/version"

Gem::Specification.new do |spec|
  spec.name = "meshtastic-client"
  spec.version = Meshtastic::VERSION
  spec.authors = ["Grant Colegate"]
  spec.email = ["blaknite@thelanbox.com.au"]

  spec.summary = "Meshtastic support for Ruby"
  spec.homepage = "https://github.com/blaknite/meshtastic-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "google-protobuf"
  spec.add_dependency "rubyserial"
end
