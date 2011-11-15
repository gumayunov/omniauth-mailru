$:.push File.expand_path("../lib", __FILE__)
require "omniauth-mailru/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-mailru"
  s.version     = Omniauth::Mailru::VERSION
  s.authors     = ["Victor Gumayunov"]
  s.email       = ["gumayunov@gmail.com"]
  s.homepage    = "https://github.com/gumayuniv/omniauth-mailru"
  s.summary     = %q{OmniAuth strategy for Mail.ru}
  s.description = %q{OmniAuth strategy for Mail.ru}

  s.rubyforge_project = "omniauth-mailru"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth', '~> 1.0'
  s.add_dependency 'omniauth-oauth2', '~> 1.0'
end
