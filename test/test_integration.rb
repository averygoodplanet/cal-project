# Run this integration test by typing "rake".
# Note that per Rakefile, these integration test
# filenames must be in path/naming convention
# of "test/test_*.rb"

# helper.rb includes helper functions
require_relative 'helper'

class TestIntegration < MiniTest::Unit::TestCase
# *** NOTE: the name of program file tested
# is below in IO.popen('ruby program_file.rb' ...)...

# an example test
def test_int1_puts_month_year_args
  shell_output = ""
  command_to_run = "ruby cal.rb 1 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read.chomp
  end
  expected_output = "1 2012"
  assert_equal expected_output, shell_output
end

## ****Example Unit Test on ./program_file.rb
#   def test_a_name_with_no_vowels
#     shell_output = ""
#     # the from IO.popen... to first "end" is the test
#     # simulating the person typing entering "brt"
#     # on name = gets.chomp
#     IO.popen('ruby cal.rb', 'r+') do |pipe|
#       pipe.puts("brt")
#       pipe.close_write
#       shell_output = pipe.read
#     end
#     expected_output = <<EOS
#    b
#     r
#     t
# EOS
#     #I'm not sure if this should be
#     #  .... expected_output, shell_output
#     # or vice versa order
#     assert_equal expected_output, shell_output
#   end
end