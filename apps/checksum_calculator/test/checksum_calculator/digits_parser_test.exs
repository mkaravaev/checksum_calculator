defmodule ChecksumCalculator.DigitsParserTest do
  use ExUnit.Case
  alias ChecksumCalculator.DigitsParser

  describe "&int_to_digits_list/1" do
    test "should convert integer to list of digits" do
      assert DigitsParser.int_to_digits_list(1234) == [1,2,3,4]
      assert DigitsParser.int_to_digits_list(10) == [1,0]
      assert DigitsParser.int_to_digits_list(1) == [1]
    end
  end
end
