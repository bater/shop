defmodule ShopWeb.Admin.UserController do
  use ShopWeb, :controller
  alias Shop.{User, Repo}

  import ShopWeb.UserController, only: [authenticate: 2]
  plug :authenticate

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end
end
