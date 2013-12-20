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
    assert_equal "Sunday", Cal.zeller(1, 2012)
  end

  def test_3_zeller_edge_cases
    assert_equal "Wednesday", Cal.zeller(2, 2012)
    assert_equal "Saturday", Cal.zeller(9, 2012)
    assert_equal "Saturday", Cal.zeller(2, 2014)
    assert_equal "Sunday", Cal.zeller(2, 2015)
    assert_equal "Thursday", Cal.zeller(2, 1900)
    assert_equal "Tuesday", Cal.zeller(2, 2000)
  end

  def test_4_zeller_2012_months
    assert_equal "Sunday", Cal.zeller(1, 2012)
    assert_equal "Wednesday", Cal.zeller(2, 2012)
    assert_equal "Thursday", Cal.zeller(3, 2012)
    assert_equal "Sunday", Cal.zeller(4, 2012)
    assert_equal "Tuesday", Cal.zeller(5, 2012)
    assert_equal "Friday", Cal.zeller(6, 2012)
    assert_equal "Sunday", Cal.zeller(7, 2012)
    assert_equal "Wednesday", Cal.zeller(8, 2012)
    assert_equal "Saturday", Cal.zeller(9, 2012)
    assert_equal "Monday", Cal.zeller(10, 2012)
    assert_equal "Thursday", Cal.zeller(11, 2012)
    assert_equal "Saturday", Cal.zeller(12, 2012)
  end

  def test_5_zeller_out_of_scope
    assert_equal "Date is out-of-scope (years 1800-3000).", Cal.zeller(1, 3001)
    assert_equal "Date is out-of-scope (years 1800-3000).", Cal.zeller(12, 1799)
  end
end