defmodule Api.PageController do
  use Api, :controller

  action_fallback Api.FallbackController

  def index(conn, _params) do
    with {:ok, checksum, _} <- ChecksumCalculator.count_checksum,
    do: render(conn, "index.json", checksum: checksum)
  end
end
