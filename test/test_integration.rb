# Run this integration test by typing "rake".
# Note that per Rakefile, these integration test
# filenames must be in path/naming convention
# of "test/test_*.rb"

# helper.rb includes helper functions
require_relative 'helper'
require File.expand_path("./cal_class.rb")

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

  def test_int2_puts_Jan_2012_header
    shell_output = ""
    command_to_run = "ruby cal.rb 1 2012"
    IO.popen(command_to_run, 'r+') do |pipe|
      shell_output = pipe.read.chomp
    end
    expected_output = "    January 2012"
    assert_equal expected_output, shell_output.lines[0].chomp
  end

  def test_int2b_puts_Jan_2012_header_test_matches_Unix_cal
    shell_output = ""
    command_to_run = "cal 1 2012"
    IO.popen(command_to_run, 'r+') do |pipe|
      shell_output = pipe.read
    end
    expected_output = "    January 2012"
    assert_equal expected_output, shell_output.lines[0].chomp
  end

  # def test_int2c_manual_spot_check
  #   year = 2012
  #   month = gets.chomp.to_i
  #   Cal.display_month(month, year)
  #   puts `cal #{month} #{year}`
  # end

  def test_int3_puts_Jan_2012_days_name_row
    shell_output = ""
    command_to_run = "ruby cal.rb 1 2012"
    IO.popen(command_to_run, 'r+') do |pipe|
      shell_output = pipe.read
    end
    expected_output = "Su Mo Tu We Th Fr Sa"
    assert_equal expected_output, shell_output.lines[1].chomp
  end

  def test_int3b_that_int3_matches_Unix_cal
    shell_output = ""
    command_to_run = "cal 1 2012"
    IO.popen(command_to_run, 'r+') do |pipe|
      shell_output = pipe.read
    end
    expected_output = "Su Mo Tu We Th Fr Sa"
    assert_equal expected_output, shell_output.lines[1].chomp
  end

  def test_int4_puts_Jan_2012_week_1
    shell_output = ""
    command_to_run = "ruby cal.rb 1 2012"
    IO.popen(command_to_run, 'r+') do |pipe|
      shell_output = pipe.read
    end
    expected_output = " 1  2  3  4  5  6  7"
    assert_equal expected_output, shell_output.lines[2].chomp
  end

  def test_int4b_that_int4_matches_Unix_cal
    shell_output = ""
    command_to_run = "cal 1 2012"
    IO.popen(command_to_run, 'r+') do |pipe|
      shell_output = pipe.read
    end
    expected_output = " 1  2  3  4  5  6  7"
    assert_equal expected_output, shell_output.lines[2].chomp
  end

  def test_int5_puts_Jan_2012_week_2
    shell_output = ""
    command_to_run = "ruby cal.rb 1 2012"
    IO.popen(command_to_run, 'r+') do |pipe|
      shell_output = pipe.read
    end
    expected_output = " 8  9 10 11 12 13 14"
    assert_equal expected_output, shell_output.lines[3].chomp
  end

  def test_int5b_that_int5_matches_Unix_cal
    shell_output = ""
    command_to_run = "cal 1 2012"
    IO.popen(command_to_run, 'r+') do |pipe|
      shell_output = pipe.read
    end
    expected_output = " 8  9 10 11 12 13 14"
    assert_equal expected_output, shell_output.lines[3].chomp
  end

def test_int6_puts_Jan_2012_week_3
  shell_output = ""
  command_to_run = "ruby cal.rb 1 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  expected_output = "15 16 17 18 19 20 21"
  assert_equal expected_output, shell_output.lines[4].chomp
end

def test_int6b_that_int6_matches_Unix_cal
  shell_output = ""
  command_to_run = "cal 1 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  expected_output = "15 16 17 18 19 20 21"
  assert_equal expected_output, shell_output.lines[4].chomp
end

def test_int7_puts_Jan_2012_week_4
  shell_output = ""
  command_to_run = "ruby cal.rb 1 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  expected_output = "22 23 24 25 26 27 28"
  assert_equal expected_output, shell_output.lines[5].chomp
end

def test_int7b_that_int7_matches_Unix_cal
  shell_output = ""
  command_to_run = "cal 1 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  expected_output = "22 23 24 25 26 27 28"
  assert_equal expected_output, shell_output.lines[5].chomp
end

def test_int8_puts_Jan_2012_week_4
  shell_output = ""
  command_to_run = "ruby cal.rb 1 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  expected_output = "29 30 31"
  assert_equal expected_output, shell_output.lines[6].chomp
end

def test_int8b_that_int8_matches_Unix_cal
  shell_output = ""
  command_to_run = "cal 1 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  expected_output = "29 30 31"
  assert_equal expected_output, shell_output.lines[6].chomp
end

def test_int9_other_Sunday_month_28_days
  shell_output = ""
  command_to_run = "ruby cal.rb 2 2026"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  assert_equal "   February 2026", shell_output.lines[0].chomp
  assert_equal "Su Mo Tu We Th Fr Sa", shell_output.lines[1].chomp
  assert_equal " 1  2  3  4  5  6  7", shell_output.lines[2].chomp
  assert_equal " 8  9 10 11 12 13 14", shell_output.lines[3].chomp
  assert_equal "15 16 17 18 19 20 21", shell_output.lines[4].chomp
  assert_equal "22 23 24 25 26 27 28", shell_output.lines[5].chomp
  # line below is key to this test
  assert_equal "", shell_output.lines[6].chomp
end

def test_int9b_that_int9_matches_Unix_cal
  shell_output = ""
  command_to_run = "cal 2 2026"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  assert_equal "   February 2026", shell_output.lines[0].chomp
  assert_equal "Su Mo Tu We Th Fr Sa", shell_output.lines[1].chomp
  assert_equal " 1  2  3  4  5  6  7", shell_output.lines[2].chomp
  assert_equal " 8  9 10 11 12 13 14", shell_output.lines[3].chomp
  assert_equal "15 16 17 18 19 20 21", shell_output.lines[4].chomp
  assert_equal "22 23 24 25 26 27 28", shell_output.lines[5].chomp
  # line below is key to this test
  assert_equal "", shell_output.lines[6].chomp
end

def test_int10_other_Sunday_month_29_days
  shell_output = ""
  command_to_run = "ruby cal.rb 2 1880"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  assert_equal "   February 1880", shell_output.lines[0].chomp
  assert_equal "Su Mo Tu We Th Fr Sa", shell_output.lines[1].chomp
  assert_equal " 1  2  3  4  5  6  7", shell_output.lines[2].chomp
  assert_equal " 8  9 10 11 12 13 14", shell_output.lines[3].chomp
  assert_equal "15 16 17 18 19 20 21", shell_output.lines[4].chomp
  assert_equal "22 23 24 25 26 27 28", shell_output.lines[5].chomp
  # line below is key to this test
  assert_equal "29", shell_output.lines[6].chomp
end

def test_int11_other_Sunday_month_30_days
  shell_output = ""
  command_to_run = "ruby cal.rb 6 2014"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  assert_equal "     June 2014", shell_output.lines[0].chomp
  assert_equal "Su Mo Tu We Th Fr Sa", shell_output.lines[1].chomp
  assert_equal " 1  2  3  4  5  6  7", shell_output.lines[2].chomp
  assert_equal " 8  9 10 11 12 13 14", shell_output.lines[3].chomp
  assert_equal "15 16 17 18 19 20 21", shell_output.lines[4].chomp
  assert_equal "22 23 24 25 26 27 28", shell_output.lines[5].chomp
  # line below is key to this test
  assert_equal "29 30", shell_output.lines[6].chomp
end

def test_int12_first_row_Mon_start
  shell_output = ""
  command_to_run = "ruby cal.rb 10 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  assert_equal "    1  2  3  4  5  6", shell_output.lines[2].chomp
end

def test_int13_first_row_Tues_start
  shell_output = ""
  command_to_run = "ruby cal.rb 5 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  assert_equal "       1  2  3  4  5", shell_output.lines[2].chomp
end

def test_int14_first_row_Wed_start
  shell_output = ""
  command_to_run = "ruby cal.rb 8 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  assert_equal "          1  2  3  4", shell_output.lines[2].chomp
end

def test_int15_first_row_Thurs_start
  shell_output = ""
  command_to_run = "ruby cal.rb 11 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  assert_equal "             1  2  3", shell_output.lines[2].chomp
end

def test_int16_first_row_Fri_start
  shell_output = ""
  command_to_run = "ruby cal.rb 6 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  assert_equal "                1  2", shell_output.lines[2].chomp
end

def test_int17_first_row_Sat_start
  shell_output = ""
  command_to_run = "ruby cal.rb 12 2012"
  IO.popen(command_to_run, 'r+') do |pipe|
    shell_output = pipe.read
  end
  assert_equal "                   1", shell_output.lines[2].chomp
end


# def test_int14_nonSunday_start_30_days
# end

# def  test_int15_nonSunday_start_31_days
# end


# def test_int13_yr_2000_line1
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "                             2000"
#   assert_equal expected_output, shell_output.lines[0].chomp
# end

# def test_int13b_that_int13_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "                             2000"
#   assert_equal expected_output, shell_output.lines[0].chomp
# end

# def test_int14_yr_2000_line2
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "" #empty line
#   assert_equal expected_output, shell_output.lines[1].chomp
# end

# def test_int14b_that_int14_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "" #empty line
#   assert_equal expected_output, shell_output.lines[1].chomp
# end

# def test_int15_yr_2000_line3
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "      January               February               March"
#   assert_equal expected_output, shell_output.lines[2].chomp
# end

# def test_int15b_that_int15_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "      January               February               March"
#   assert_equal expected_output, shell_output.lines[2].chomp
# end

# def test_int16_yr_2000_line4
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
#   assert_equal expected_output, shell_output.lines[3].chomp
# end

# def test_int16b_that_int16_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
#   assert_equal expected_output, shell_output.lines[3].chomp
# end

# def test_int17_yr_2000_line5
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "                   1         1  2  3  4  5            1  2  3  4"
#   assert_equal expected_output, shell_output.lines[4].chomp
# end

# def test_int17b_that_int17_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "                   1         1  2  3  4  5            1  2  3  4"
#   assert_equal expected_output, shell_output.lines[4].chomp
# end

# def test_int18_yr_2000_line9
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "23 24 25 26 27 28 29  27 28 29              26 27 28 29 30 31"
#   assert_equal expected_output, shell_output.lines[8].chomp
# end

# def test_int18b_that_int18_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "23 24 25 26 27 28 29  27 28 29              26 27 28 29 30 31"
#   assert_equal expected_output, shell_output.lines[8].chomp
# end

# def test_int19_yr_2000_line10
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "30 31"
#   assert_equal expected_output, shell_output.lines[9].chomp
# end

# def test_int19b_that_int19_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "30 31                                       "
#   assert_equal expected_output, shell_output.lines[9].chomp
# end

# def test_int20_yr_2000_line11
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "       April                  May                   June"
#   assert_equal expected_output, shell_output.lines[10].chomp
# end

# def test_int20b_that_int20_matches_Unix_cal
#     shell_output = ""
#     command_to_run = "cal 2000"
#     IO.popen(command_to_run, 'r+') do |pipe|
#       shell_output = pipe.read.chomp
#     end
#     expected_output = "       April                  May                   June"
#     assert_equal expected_output, shell_output.lines[10].chomp
# end

# def test_int21_yr_2000_line34
#   shell_output = ""
#   command_to_run = "ruby cal.rb 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "                                            31"
#   assert_equal expected_output, shell_output.lines[33].chomp
# end

# def test_int21b_that_int21_matches_Unix_cal
#   shell_output = ""
#   command_to_run = "cal 2000"
#   IO.popen(command_to_run, 'r+') do |pipe|
#     shell_output = pipe.read.chomp
#   end
#   expected_output = "                                            31"
#   assert_equal expected_output, shell_output.lines[33].chomp
# end

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