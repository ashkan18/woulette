defmodule Woulette.Router do
  use Woulette.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Absinthe.Plug.GraphiQL, schema: Woulette.Schema
  end

  scope "/", Woulette do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/bets", BetController
    resources "/user_bets", UserBetController
  end

  scope "/api" do
    pipe_through :api
    forward "/", Absinthe.Plug, schema: Woulette.Schema
    if Mix.env == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Woulette.Schema
    end
  end
end
