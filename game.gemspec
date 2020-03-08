
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "game/version"

Gem::Specification.new do |spec|
  spec.name          = "game"
  spec.version       = Game::VERSION
  spec.authors       = ["Luis Vasconcellos"]
  spec.email         = ["luis@luisvasconcellos.com"]

  spec.summary       = %q{A ruby game}
  spec.description   = %q{A ruby game}
  spec.homepage      = "http://github.com/lfv89/ruby-game.rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "pry"
end
