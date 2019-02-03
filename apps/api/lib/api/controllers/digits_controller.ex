defmodule Api.DigitsController do
  use Api, :controller

  action_fallback Api.FallbackController

  def index(conn, %{"with_positions" => "true"}) do
    with state <- ChecksumCalculator.get_state(with_positions: true),
    do: json(conn, state)
  end
  def index(conn, params) do
    with state <- ChecksumCalculator.get_state,
    do: json(conn, state)
  end

  def create(conn, %{"value" => val}) do
    with :ok <- ChecksumCalculator.add(val),
    do: json(conn, :ok)
  end

  def update(conn, %{"id" => position, "value" => val}) do
    with :ok <- ChecksumCalculator.append(val, position: position),
    do: json(conn, :ok)
  end

  def delete(conn, _params) do
    with :ok <- ChecksumCalculator.clear_state,
    do: json(conn, :ok)
  end

end
