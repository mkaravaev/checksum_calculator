defmodule ChecksumCalculatorTest do
  use ChecksumCalculator.StorageCase
  alias ChecksumCalculator.Storage

  describe "&add/1" do
    test "should push new number to storage" do
      ChecksumCalculator.add(3333)
      ChecksumCalculator.add(44444)
      assert Storage.get_storage_map == %{1 => [3,3,3,3], 2 => [4,4,4,4,4]}
    end
  end

  describe "&append/2" do
    setup [:generate_storage]

    test "should append digits to existent digit" do
      first_value = Storage.get_storage_map[1]
      ChecksumCalculator.append(1000, position: 1)

      assert Storage.get_storage_map[1] == [first_value, 1, 0, 0, 0]
    end

    test "should return error if element not exist" do
      assert ChecksumCalculator.append(999, position: 100) == {:error, :not_exisiting_position}
    end
  end

  describe "&count_checksum/0" do
    setup [:generate_storage]

    test "should generate checksum" do
      assert ChecksumCalculator.count_checksum == 5
    end

    test "should return timout error when exceed execution limit" do
      assert ChecksumCalculator.count_checksum(0) == {:error, :timeout}
    end
  end

  describe "&clear_state/0" do
    setup [:generate_storage]

    test "should reset storage state" do
      refute ChecksumCalculator.get_state == []
      assert ChecksumCalculator.clear_state == :ok
      assert ChecksumCalculator.get_state == []
      assert ChecksumCalculator.get_state(with_positions: true) == %{}
    end
  end
end
