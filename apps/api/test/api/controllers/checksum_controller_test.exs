defmodule Api.ChecksumControllerTest do
  use Api.ConnCase
  use ChecksumCalculator.StorageCase

  setup [:generate_storage]

  test "GET /checksum", %{conn: conn} do
    conn = get(conn, checksum_path(conn, :index))
    assert json_response(conn, 200) == 5
  end
end
