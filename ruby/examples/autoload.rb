require_relative '../lib/autoload.rb'

Autoload.init.add_path '.', '../lib'
# => ["some_path/t33e/ruby/examples", "some_path/t33e/ruby/examples/lib"]

HelloWorld.new.say 'hello everyone!'
# => "hello everyone!"

p Autoload.load_paths
# => ["some_path/t33e/ruby/examples", "some_path/t33e/ruby/examples/lib"]

class Test
  using StringExtensions

  p "StringExtensions".snakecase
  # => "string_extensions"

  p "AaBbCcDdEeFf".snakecase
  # => "aa_bb_cc_dd_ee_ff"

  p "ABCDEF".snakecase
  # => "abcdef"

  p "hello_world".camelcase
  # => "HelloWorld"

  p "hello_world".camelcase(:lower)
  # => "helloWorld"
end
