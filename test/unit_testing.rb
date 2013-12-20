# Run this unit test file by typing "ruby test/this_file_name.rb"

# name of the file being tested
require File.expand_path("./a_class_file.rb")
require 'minitest/autorun'
require_relative 'helper'

class TestThisClass < MiniTest::Unit::TestCase

  ## Example Unit Test
  # def test_1_date_parser_has_a_parse_method
  #   DateParser.parse("12/22/2012")
  # end
end