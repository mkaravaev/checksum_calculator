defmodule Api.ChecksumController do
  use Api, :controller

  action_fallback Api.FallbackController

  def index(conn, _params) do
    with checksum <- ChecksumCalculator.count_checksum,
    do: json(conn, checksum)
  end
end
