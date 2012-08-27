class Module
  def replace_methods!(pattern, replacement)
    public_instance_methods.grep(pattern).each do |method|
      alias_method method.to_s.sub(pattern, replacement), method
      send :undef_method, method
    end
  end
end

module MiniTest::Expectations
  replace_methods! /^must/, 'should'
  replace_methods! /^wont/, 'should_not'
end
