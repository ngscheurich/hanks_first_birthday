defmodule HanksFirstBirthday.Router do
  use HanksFirstBirthday.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HanksFirstBirthday do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", HanksFirstBirthday do
    pipe_through :api

    resources "/notes", NoteController, except: [:new, :edit]
  end
end
