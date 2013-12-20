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
# def test_int1_puts_month_year_args
#   shell_output = ""
#   command_to_run = "ruby cal.rb 1 2012"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "1 2012"
#   assert_equal expected_output, shell_output
# end

#   def test_int2_puts_Jan_2012_header
#     shell_output = ""
#     command_to_run = "ruby cal.rb 1 2012"
#     IO.popen(command_to_run, 'r+') do |pipe|
#       shell_output = pipe.read.chomp
#     end
#     expected_output = "    January 2012"
#     assert_equal expected_output, shell_output.lines[0].chomp
#   end

#   def test_int2b_puts_Jan_2012_header_test_matches_Unix_cal
#     shell_output = ""
#     command_to_run = "cal 1 2012"
#     IO.popen(command_to_run, 'r+') do |pipe|
#       shell_output = pipe.read
#     end
#     expected_output = "    January 2012"
#     assert_equal expected_output, shell_output.lines[0].chomp
#   end

#   def test_int3_puts_Jan_2012_days_name_row
#     shell_output = ""
#     command_to_run = "ruby cal.rb 1 2012"
#     IO.popen(command_to_run, 'r+') do |pipe|
#       shell_output = pipe.read
#     end
#     expected_output = "Su Mo Tu We Th Fr Sa"
#     assert_equal expected_output, shell_output.lines[1].chomp
#   end

#   def test_int3b_that_int3_matches_Unix_cal
#     shell_output = ""
#     command_to_run = "cal 1 2012"
#     IO.popen(command_to_run, 'r+') do |pipe|
#       shell_output = pipe.read
#     end
#     expected_output = "Su Mo Tu We Th Fr Sa"
#     assert_equal expected_output, shell_output.lines[1].chomp
#   end

#   def test_int4_puts_Jan_2012_week_1
#     shell_output = ""
#     command_to_run = "ruby cal.rb 1 2012"
#     IO.popen(command_to_run, 'r+') do |pipe|
#       shell_output = pipe.read
#     end
#     expected_output = " 1  2  3  4  5  6  7"
#     assert_equal expected_output, shell_output.lines[2].chomp
#   end

#   def test_int4b_that_int4_matches_Unix_cal
#     shell_output = ""
#     command_to_run = "cal 1 2012"
#     IO.popen(command_to_run, 'r+') do |pipe|
#       shell_output = pipe.read
#     end
#     expected_output = " 1  2  3  4  5  6  7"
#     assert_equal expected_output, shell_output.lines[2].chomp
#   end

#   def test_int5_puts_Jan_2012_week_2
#     shell_output = ""
#     command_to_run = "ruby cal.rb 1 2012"
#     IO.popen(command_to_run, 'r+') do |pipe|
#       shell_output = pipe.read
#     end
#     expected_output = " 8  9 10 11 12 13 14"
#     assert_equal expected_output, shell_output.lines[3].chomp
#   end

#   def test_int5b_that_int5_matches_Unix_cal
#     shell_output = ""
#     command_to_run = "cal 1 2012"
#     IO.popen(command_to_run, 'r+') do |pipe|
#       shell_output = pipe.read
#     end
#     expected_output = " 8  9 10 11 12 13 14"
#     assert_equal expected_output, shell_output.lines[3].chomp
#   end

# def test_int6_puts_Jan_2012_week_3
#   shell_output = ""
#   command_to_run = "ruby cal.rb 1 2012"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read
#   end
#   expected_output = "15 16 17 18 19 20 21"
#   assert_equal expected_output, shell_output.lines[4].chomp
# end

# def test_int6b_that_int6_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 1 2012"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read
#   end
#   expected_output = "15 16 17 18 19 20 21"
#   assert_equal expected_output, shell_output.lines[4].chomp
# end

# def test_int7_puts_Jan_2012_week_4
#   shell_output = ""
#   command_to_run = "ruby cal.rb 1 2012"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read
#   end
#   expected_output = "22 23 24 25 26 27 28"
#   assert_equal expected_output, shell_output.lines[5].chomp
# end

# def test_int7b_that_int7_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 1 2012"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read
#   end
#   expected_output = "22 23 24 25 26 27 28"
#   assert_equal expected_output, shell_output.lines[5].chomp
# end

# def test_int8_puts_Jan_2012_week_4
#   shell_output = ""
#   command_to_run = "ruby cal.rb 1 2012"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read
#   end
#   expected_output = "29 30 31"
#   assert_equal expected_output, shell_output.lines[6].chomp
# end

# def test_int8b_that_int8_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 1 2012"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read
#   end
#   expected_output = "29 30 31"
#   assert_equal expected_output, shell_output.lines[6].chomp
# end

# def test_int9_puts_Feb_2000_header
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "   February 2000"
#   assert_equal expected_output, shell_output.lines[0].chomp
# end

# def test_int9b_that_int9_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "   February 2000"
#   assert_equal expected_output, shell_output.lines[0].chomp
# end

# def test_int10_puts_Feb_2000_days_name_row
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "Su Mo Tu We Th Fr Sa"
#   assert_equal expected_output, shell_output.lines[1].chomp
# end

# def test_int10b_that_int10_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "Su Mo Tu We Th Fr Sa"
#   assert_equal expected_output, shell_output.lines[1].chomp
# end

# def test_int11_puts_Feb_2000_week_1
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "       1  2  3  4  5"
#   assert_equal expected_output, shell_output.lines[2].chomp
# end

# def test_int11b_that_int11_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "       1  2  3  4  5"
#   assert_equal expected_output, shell_output.lines[2].chomp
# end

def test_int12_puts_Feb_2000_week_5
  shell_output = ""
  command_to_run = "ruby cal.rb 2 2000"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read.chomp
  end
  expected_output = "27 28 29"
  assert_equal expected_output, shell_output.lines[6].chomp
end

def test_int12b_that_int12_matches_Unix_cal
  shell_output = ""
  command_to_run = "cal 2 2000"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read.chomp
  end
  expected_output = "27 28 29"
  assert_equal expected_output, shell_output.lines[6].chomp
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