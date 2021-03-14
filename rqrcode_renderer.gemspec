# frozen_string_literal: true

require_relative 'lib/rqrcode_renderer/version'

Gem::Specification.new do |spec|
  spec.name          = 'rqrcode_renderer'
  spec.version       = RqrcodeRenderer::VERSION
  spec.authors       = ['yaboojp']
  spec.email         = ['yaboo.ja@gmail.com']

  spec.summary       = 'Render QR codes with Rails.'
  spec.description   = 'Render QR codes with Rails.'
  spec.homepage      = 'https://github.com/yaboojp/rqrcode_renderer'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/yaboojp/rqrcode_renderer'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 6.0'
  spec.add_dependency 'rqrcode', '>= 1.2.0'
end
