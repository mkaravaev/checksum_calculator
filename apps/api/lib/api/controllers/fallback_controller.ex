defmodule Api.FallbackController do
  use Api, :controller

  def call(conn, {:error, error}) do
    conn
      |> put_status(422)
      # |> put_view(ErrorView)
      |> render("error.json", errors: error)
      |> halt()
  end

end
