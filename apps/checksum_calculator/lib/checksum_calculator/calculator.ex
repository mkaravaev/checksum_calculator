defmodule ChecksumCalculator.Calculator do
  @moduledoc """
  Calculates Checksum from given List of digits
  """
  alias __MODULE__

  defstruct [state: :odd, even_sum: 0, odd_sum: 0, result: 0]

  @odd_multiplier 3
  @devisor 10

  @spec perform(list) :: integer
  def perform([]), do: 0
  def perform(list) do
    Enum.reduce(list, %Calculator{}, &reducer/2)
    |> multiply_odd()
    |> add_up_odd_and_even()
    |> divide()
    |> extract_result()
  end

  defp reducer(elem, %{state: :even, even_sum: even_sum} = acc) do
    %{acc | state: :odd, even_sum: even_sum + elem}
  end
  defp reducer(elem, %{state: :odd, odd_sum: odd_sum} = acc) do
    %{acc | state: :even, odd_sum: odd_sum + elem}
  end

  defp multiply_odd(%Calculator{odd_sum: odd_sum}=calc, multiplier\\@odd_multiplier) do
    %{calc | odd_sum: odd_sum * multiplier}
  end

  defp add_up_odd_and_even(%{odd_sum: odd_sum, even_sum: even_sum}=calc) do
    %{calc | result: odd_sum + even_sum}
  end

  def divide(%{result: odd_even_sum} = calc, devisor\\@devisor) do
    case rem(odd_even_sum, devisor) do
      0 -> %{calc | result: 0}
      reminder -> %{calc | result: devisor - reminder}
    end
  end

  defp extract_result(%{result: result}), do: result

end
