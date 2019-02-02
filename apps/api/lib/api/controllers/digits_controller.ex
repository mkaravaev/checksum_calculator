defmodule Api.DigitsController do
  use Api, :controller

  action_fallback Api.FallbackController

  def create(conn, %{"value" => val}) do
    with :ok <- ChecksumCalculator.add(val),
    do: render(conn, :ok)
  end

  def update(conn, %{"value" => val, "digit" => position} = params) do
    IO.inspect params

    with ChecksumCalculator.append(val, position: position),
    do: render(conn, :ok)
  end

  def delete(conn, _params) do
    with :ok <- ChecksumCalculator.delet_state,
    do: render(conn, :ok)
  end

end
