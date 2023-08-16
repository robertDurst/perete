require File.expand_path("../lib/perete/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "perete"
  s.version     = Perete::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = "MIT"
  s.authors     = ["Rob Durst"]
  s.email       = ["me@robdurst.com"]
  s.homepage    = "http://github.com/robertdurst/perete"
  s.summary     = "Performance Testing Tool"
  s.description = "Performance regression framework and executor."

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path = ['lib']

  # If you need an executable, add it here
  # s.executables = ["newgem"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
  all_files       = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.executables = all_files.grep(%r!^exe/!) { |f| File.basename(f) }
  s.bindir      = "exe"

  s.add_runtime_dependency("benchmark-ips",           "~> 2.12")
end