defmodule ChecksumCalculator.DigitsParser do
  @moduledoc"""
  parse multi digit integer to list of digits
  """

  @spec int_to_digits_list(non_neg_integer) :: list(non_neg_integer)
  def int_to_digits_list(int) when is_integer(int) and int >= 0 do
    int
    |> from_int_to_charlist()
    |> from_charlist_to_int_list
  end
  def int_to_digits_list(_), do: {:error, :wrong_integer}

  defp from_charlist_to_int_list(charlist) when is_list(charlist) do
    Enum.map(charlist, &from_ascii_to_int/1)
  end

  defp from_ascii_to_int(num) when num >= 48 and num < 58, do: num - 48

  defp from_int_to_charlist(int), do: :erlang.integer_to_list(int)

end
