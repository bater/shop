defmodule ShopWeb.CartPlug do
  import Plug.Conn

  alias Shop.{Repo, Cart}

  def init(default), do: default

  def call(conn, _params) do
    conn
      |> find_cart
  end

  def find_cart(conn) do
    cart_id = get_session(conn, :cart_id)

    if cart_present?(cart_id) do
      case Repo.get(Cart, cart_id) do
        nil ->
          conn
            |> create_cart
        cart ->
          conn
            |> put_session(:cart_id, cart_id)
            |> assign(:current_cart, cart)
            |> configure_session(renew: true)
      end
    else
      conn
        |> create_cart
    end
  end

  def create_cart(conn) do
    changeset = Cart.changeset(%Cart{}, %{})
    case Repo.insert(changeset) do
      {:ok, cart} ->
        conn
          |> put_session(:cart_id, cart.id)
          |> assign(:current_cart, cart)
          |> configure_session(renew: true)
      {:error, _} ->
        conn
    end
  end

  def cart_present?(res) do
    case res do
      nil -> false
      _   -> true
    end
  end

end
