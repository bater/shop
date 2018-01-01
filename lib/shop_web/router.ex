defmodule ShopWeb.Router do
  use ShopWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug ShopWeb.Auth, repo: Shop.Repo
  end

  pipeline :admin_layout do
    plug :put_layout, {ShopWeb.LayoutView, :admin}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShopWeb do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/products", ProductController, only: [:index, :show]
  end

  scope "/admin", ShopWeb.Admin, as: :admin do
    pipe_through [:browser, :admin_layout]
    resources "/products", ProductController
    resources "/users", UserController, except: [:show, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShopWeb do
  #   pipe_through :api
  # end
end
