Gem::Specification.new do |s|
  s.name        = 'minitest-spec-should'
  s.version     = '0.1.0'
  s.summary     = 'Support for traditional BDD syntax in MiniTest::Spec'
  s.description = 'Replaces must/wont methods with should/should_not methods in MiniTest::Spec'
  s.files       = Dir['lib/**/*']
  s.author      = 'Steve McKinney'
  s.email       = 'steve.mckinney@gmail.com'
  s.homepage    = 'http://github.com/stephenmckinney/minitest-spec-should'

  s.add_dependency 'minitest'

  s.add_development_dependency 'rake'
end
