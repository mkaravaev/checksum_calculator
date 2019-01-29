defmodule ChecksumCalculator do
  @moduledoc """
  Documentation for ChecksumCalculator.
  """

  alias ChecksumCalculator.Storage

  @spec add(integer) :: :ok
  def add(val), do: Storage.push(val)

  @spec append(integer, integer) :: :ok | {:error, atom}
  def append(position, val), do: Storage.append(position, val)

  @spec get_checksum() :: {:ok, integer} | {:error, atom}
  def get_checksum do
    true
  end
end
