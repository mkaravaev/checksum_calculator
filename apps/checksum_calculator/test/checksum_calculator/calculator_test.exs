defmodule ChecksumCalculator.CalculatorTest do
  use ChecksumCalculator.StorageCase
  alias ChecksumCalculator.{Calculator, Storage}

  @test_list [5,4,8,9,8,5,0,3,5,4]

  describe "&perform/1" do
    test "should calculate checksum" do
      assert Calculator.perform(@test_list) == 7
    end

    test "should return 0 if empty list passed" do
      assert Calculator.perform([]) == 0
    end
  end
end
