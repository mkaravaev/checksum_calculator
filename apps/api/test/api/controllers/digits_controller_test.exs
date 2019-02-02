defmodule Api.DigitsControllerTest do
  use Api.ConnCase

  test "GET /digits", %{conn: conn} do
  end

  @tag :focus
  test "POST /digits", %{conn: conn} do
    conn = post(conn, digits_path(conn, :create), value: 1234)
    assert json_response(conn, 200) == "ok"
  end

  test "PATCH/PUT /digits", %{conn: conn} do
    conn = patch(conn, digits_path(conn, :update, 2), value: 2223)
    assert json_response(conn, 200) == "ok"
  end

  test "DELETE /digits", %{conn: conn} do
    conn = delete(conn, digits_path(conn, :delete))
    assert json_response(conn, 200) == "ok"
  end
  
end
