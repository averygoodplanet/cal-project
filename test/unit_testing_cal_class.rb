# Run this unit test file by typing "ruby test/this_file_name.rb"

# name of the file being tested
require File.expand_path("./cal_class.rb")
require 'minitest/autorun'
require_relative 'helper'

class TestCalClass < MiniTest::Unit::TestCase

  ## Example Unit Test
  def test_1_create_Cal_instance
    myCalendar = Cal.new
    assert_equal Cal, myCalendar.class
  end

  def test_2_zeller_base_case
    # assert_equal "Sunday", Cal.zeller(1, 2012)
    assert_equal 1, Cal.zeller(1, 2012)
    assert_equal 4, Cal.zeller(2, 2012)
    assert_equal 3, Cal.zeller(2, 2000)
  end

#Tests 3 and 4 were removed--they were for printing weekday name
# of the first day of the month, which was an unnecessary feature
# that was removed.

  def test_5_number_of_days_in_month_not_February
    assert_equal 31, Cal.number_of_days_in_month(1, 2012)
    assert_equal 31, Cal.number_of_days_in_month(3, 2012)
    assert_equal 30, Cal.number_of_days_in_month(4, 2012)
    assert_equal 31, Cal.number_of_days_in_month(5, 2012)
    assert_equal 30, Cal.number_of_days_in_month(6, 2012)
    assert_equal 31, Cal.number_of_days_in_month(7, 2012)
    assert_equal 31, Cal.number_of_days_in_month(8, 2012)
    assert_equal 30, Cal.number_of_days_in_month(9, 2012)
    assert_equal 31, Cal.number_of_days_in_month(10, 2012)
    assert_equal 30, Cal.number_of_days_in_month(11, 2012)
    assert_equal 31, Cal.number_of_days_in_month(12, 2012)
  end

  def test_6_get_month_name
    assert_equal "January", Cal.get_month_name(1)
  end

  def test_7_leap_year_checks
    # check century years that aren't multiples of 400
    assert_equal false, Cal.leap_year?(1700)
    assert_equal false, Cal.leap_year?(1800)
    assert_equal false, Cal.leap_year?(1900)
    # check century years that are multiples of 400
    assert_equal true, Cal.leap_year?(1600)
    assert_equal true, Cal.leap_year?(2000)
    #  check non-century years that are multiples of 4
    assert_equal true, Cal.leap_year?(1984)
    assert_equal true, Cal.leap_year?(1904)
    assert_equal true, Cal.leap_year?(1964)
    # check non-century years that aren't multiples of 4
    assert_equal false, Cal.leap_year?(1982)
    assert_equal false, Cal.leap_year?(1861)
    assert_equal false, Cal.leap_year?(1891)
  end

  def test_8_number_of_days_in_month_February
    assert_equal 29, Cal.number_of_days_in_month(2, 2000)
    assert_equal 28, Cal.number_of_days_in_month(2, 2001)
    assert_equal 29, Cal.number_of_days_in_month(2, 2004)
    assert_equal 28, Cal.number_of_days_in_month(2, 1900)
    assert_equal 28, Cal.number_of_days_in_month(2, 2005)
  end

  def test_9_months_string_arrays_1st_trimester_2013
    expected = [ ["      January       ",
                          "Su Mo Tu We Th Fr Sa",
                          "       1  2  3  4  5",
                          " 6  7  8  9 10 11 12",
                          "13 14 15 16 17 18 19",
                          "20 21 22 23 24 25 26",
                          "27 28 29 30 31"],
                          ["      February      ",
                           "Su Mo Tu We Th Fr Sa",
                           "                1  2",
                           " 3  4  5  6  7  8  9",
                           "10 11 12 13 14 15 16",
                           "17 18 19 20 21 22 23",
                            "24 25 26 27 28"],
                          ["       March        ",
                          "Su Mo Tu We Th Fr Sa",
                          "                1  2",
                          " 3  4  5  6  7  8  9",
                          "10 11 12 13 14 15 16",
                          "17 18 19 20 21 22 23",
                          "24 25 26 27 28 29 30",
                          "31"]]
    months_string_arrays = []
    for i in 0..2
      # e.g. January's row strings are stored in month_string_arrays[0]
      months_string_arrays[i] = Cal.get_month_strings_array_without_year_header(i+1, 2013)
    end
    assert_equal expected, months_string_arrays
    # January 2013 should have 7 rows,  [7-2 =] 5 week rows
    assert_equal 7, months_string_arrays[0].length
    # February 2013 should have 7 rows,  [7-2 =] 5 week rows
    assert_equal 7, months_string_arrays[1].length
    # March 2013 should have 8 rows, [8 -2 =] 6 week rows
    assert_equal 8, months_string_arrays[2].length
    # Should get nil if you call index of > (length - 1 (since indexes count
    #from zero)) on January 2013 subarray?
    assert_equal true, months_string_arrays[0][7].nil?
    assert_equal false, months_string_arrays[0][6].nil?
  end

end