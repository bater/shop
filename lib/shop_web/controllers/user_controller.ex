defmodule ShopWeb.UserController do
  use ShopWeb, :controller
  alias Shop.User
  alias Shop.Repo

  def new(conn, _params) do
    changeset = User.changeset(%User{}, _params)
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.username} created")
        |> redirect(to: page_path(conn, :index))

      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end
end
