defmodule Api.Router do
  use Api, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Api do
    pipe_through :api

    scope "/checksum", PageController, only: [:index] do
      resources "/digits", DigitsController, only: [:update, :create]
      delete "/digits", DigitsController, :delete
    end
  end

end
