defmodule Api.Router do
  use Api, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Api do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/checksum", Api do
    pipe_through :api

    get "/", ChecksumController, :index
    resources "/digits", DigitsController, only: [:update, :create, :index]
    delete "/digits", DigitsController, :delete
  end

end

