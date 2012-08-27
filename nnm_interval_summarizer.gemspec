# I don't know why dose occur errors below.
#  require_relative 'lib/nnm_interval_summarizer/version'
require File.expand_path('../lib/nnm_interval_summarizer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.summary       = %q{"ovsnmp.conf(xnmsnmpconf -export)" to some CSV files.}
  gem.description   = %q{An utility for the NNM(NetworkNodeManager).
"ovsnmp.conf(xnmsnmpconf -export)" to some CSV files.}
  gem.homepage      = 'https://github.com/kachick/nnm_interval_summarizer'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features|declare)/})
  gem.name          = 'nnm_interval_summarizer'
  gem.require_paths = ['lib']
  gem.version       = NNM_Interval_Summarizer::VERSION.dup # dup for https://github.com/rubygems/rubygems/commit/48f1d869510dcd325d6566df7d0147a086905380#-P0

  gem.required_ruby_version = '>=1.9.2'

  gem.add_runtime_dependency 'striuct', '~>0.3.0'
  gem.add_runtime_dependency 'time-unit', '~>0.0.7'
  gem.add_runtime_dependency 'lettercase', '~>0.0.2'

  gem.add_development_dependency 'test-declare', '~>0.0.2.1'
  gem.add_development_dependency 'yard', '>=0.8.2.1'
end

