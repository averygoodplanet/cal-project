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
end