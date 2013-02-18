# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mirror_github/version"

Gem::Specification.new do |s|
  s.name        = "mirror_github"
  s.version     = MirrorGithub::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Casey Dreier", "Leon Miller-Out"]
  s.email       = ["casey.dreier@gmail.com", "leon@singlebrook.com"]
  s.homepage    = "https://github.com/singlebrook/mirror_github"
  s.summary     = %q{Command-line library for mirroring an Organization's GitHub repositories}
  s.description = %q{Command-line library for mirroring an Organization's GitHub repositories}
  s.license     = 'BSD'

  s.rubyforge_project = "mirror_github"

  s.add_dependency 'rest-client'
  s.add_dependency 'json_pure'

  s.add_development_dependency 'fakeweb'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
