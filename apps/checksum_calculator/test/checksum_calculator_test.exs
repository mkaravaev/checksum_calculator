defmodule ChecksumCalculatorTest do
  use ChecksumCalculator.StorageCase
  alias ChecksumCalculator.Storage

  describe "&add/1" do
    test "should push new number to storage" do
      ChecksumCalculator.add(3333)
      ChecksumCalculator.add(44444)
      assert Storage.get_storage_map == %{1 => 3333, 2 => 44444}
    end
  end

  describe "&append/2" do
    setup [:generate_storage]

    test "should append digits to existent digit" do
      first_value = Storage.get_storage_map[1]
      ChecksumCalculator.append(1, 000)

      assert Storage.get_storage_map[1] == [first_value, 000]
    end

    test "should return error if element not exist" do
      assert ChecksumCalculator.append(100, 999) == {:error, :not_exisiting_position}
    end
  end

  describe "&get_checksum/0" do
    setup [:generate_storage]

    test "should generate checksum" do
      assert ChecksumCalculator.get_checksum == true
    end
  end
end
