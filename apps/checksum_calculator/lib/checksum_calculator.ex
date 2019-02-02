defmodule ChecksumCalculator do
  @moduledoc """
  Main API Module for ChecksumCalculator.
  """

  alias ChecksumCalculator.{Storage, DigitsParser, Calculator}
  alias ChecksumCalculator.Presenters.StoragePresenter

  @type options :: {:position, integer}

  @task_compute_time 15

  @spec add(integer) :: :ok
  def add(val) when val >= 0 and val < 10, do: Storage.push(val)
  def add(val) do
    val
    |> DigitsParser.int_to_digits_list
    |> Storage.push
  end

  @spec append(integer, [options]) :: :ok | {:error, atom}
  def append(val, position: position) do
    with list <- DigitsParser.int_to_digits_list(val),
    do: Storage.append(position, list)
  end

  @spec count_checksum() :: {:ok, integer} | {:error, atom}
  def count_checksum(timeout\\@task_compute_time) do
    try do
      Task.async(&_count_checksum/0)
      |> Task.await(timeout)
    catch
      :exit, {:timeout, _} -> {:error, :timeout}
    end
  end

  @spec clear_state() :: :ok | {:error, atom}
  defdelegate clear_state, to: Storage, as: :delete_all

  @spec get_state(options) :: tuple | list
  def get_state, do: get_storage_as_list()
  def get_state(with_positions: true), do: Storage.get_storage_map

  defp _count_checksum do
    get_storage_as_list() |> Calculator.perform()
  end

  defp get_storage_as_list do
    Storage.get_storage_map
    |> StoragePresenter.to_flat_list
  end

end
