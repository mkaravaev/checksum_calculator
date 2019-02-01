defmodule ChecksumCalculator.Presenters.StoragePresenter do
  def to_flat_list(map) do
    map
    |> Map.values
    |> List.flatten
  end
end
