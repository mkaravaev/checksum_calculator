defmodule Api.DigitsControllerTest do
  use Api.ConnCase
  use ChecksumCalculator.StorageCase

  setup [:generate_storage]

  test "GET /digits should return list", %{conn: conn} do
    conn = get(conn, digits_path(conn, :index))

    assert json_response(conn, 200) |> is_list == true
    assert json_response(conn, 200) == ChecksumCalculator.get_state
  end

  test "GET /digits?with_positions=true should return map", %{conn: conn} do
    conn = get(conn, digits_path(conn, :index), %{"with_positions" => "true"})

    assert json_response(conn, 200) |> is_map == true
    assert do 
      json_response(conn, 200) ==
        ChecksumCalculator.get_state(with_positions: true)
        |> keys_to_strings()
    end
  end

  test "POST /digits", %{conn: conn} do
    conn = post(conn, digits_path(conn, :create), value: 1234)
    assert json_response(conn, 200) == "ok"
  end

  test "PATCH/PUT /digits", %{conn: conn} do
    state_before = ChecksumCalculator.get_state(with_positions: true)[2]
    conn = patch(conn, digits_path(conn, :update, 2), value: 2223)

    assert json_response(conn, 200) == "ok"
    assert do
      ChecksumCalculator.get_state(with_positions: true)[2] ==
        List.wrap(state_before) ++ [2,2,2,3]
    end
  end

  test "DELETE /digits", %{conn: conn} do
    conn = delete(conn, digits_path(conn, :delete))
    assert json_response(conn, 200) == "ok"
    assert ChecksumCalculator.get_state == []
  end

  defp keys_to_strings(map) do
    for {key, val} <- map, into: %{}, do: {Integer.to_string(key), val}
  end

end
