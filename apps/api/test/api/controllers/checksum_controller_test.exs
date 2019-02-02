defmodule Api.ChecksumControllerTest do
  use Api.ConnCase

  test "GET /checksum", %{conn: conn} do
    conn = get(conn, checksum_path(conn, :index))
    assert json_response(conn, 200) == 0
  end
end
