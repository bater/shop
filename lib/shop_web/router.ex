defmodule ShopWeb.Router do
  use ShopWeb, :router

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

  scope "/", ShopWeb do
    pipe_through :browser # Use the default browser stack
    resources "/users", UserController, only: [:new, :create]
    get "/", PageController, :index
  end

  scope "/admin", ShopWeb.Admin, as: :admin do
    pipe_through :browser

    resources "/products", ProductController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShopWeb do
  #   pipe_through :api
  # end
end
