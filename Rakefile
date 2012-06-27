gem 'hoe', '~> 3.0.6'
require 'hoe'
require 'fileutils'

Hoe.plugin :newgem

$hoe = Hoe.spec 'nnm_event_summarizer' do
  developer 'Kenichi Kamiya', 'kachick1+ruby@gmail.com'
  self.rubyforge_name       = name
  require_ruby_version '>= 1.9.3'
  dependency 'striuct', '~> 0.3.0', :runtime
  dependency 'time-unit', '~> 0.0.7', :runtime
  dependency 'lettercase', '~> 0.0.2', :runtime
  dependency 'yard', '>= 0.8.2', :development
  dependency 'declare', '~> 0.0.4', :development
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each {|t|load t}
