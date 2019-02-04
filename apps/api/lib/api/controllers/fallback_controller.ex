defmodule Api.FallbackController do
  use Api, :controller

  def call(conn, {:error, error}) do
    conn
      |> put_status(422)
      |> json(%{error: error})
      |> halt()
  end

end
