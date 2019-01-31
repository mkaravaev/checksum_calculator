defmodule ChecksumCalculator.DigitsParserTest do
  use ExUnit.Case
  alias ChecksumCalculator.DigitsParser

  describe "&int_to_digits_list/1" do
    test "should convert integer to list of digits" do
      assert DigitsParser.int_to_digits_list(1234) == [1,2,3,4]
      assert DigitsParser.int_to_digits_list(10) == [1,0]
      assert DigitsParser.int_to_digits_list(0) == [0]
    end

    test "should return error if integer is less than 0" do
      assert DigitsParser.int_to_digits_list(-1) == {:error, :wrong_integer}
      assert DigitsParser.int_to_digits_list(-1222) == {:error, :wrong_integer}
    end
  end
end
