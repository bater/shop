defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  alias Shop.{Goods, CartItem, Repo}
  alias Shop.Goods.Product
  import ShopWeb.CartController, only: [current_cart: 1]

  def index(conn, _params) do
    products = Goods.list_products()
    render(conn, "index.html", products: products)
  end

  def show(conn, %{"id" => id}) do
    product = Goods.get_product!(id)
    render(conn, "show.html", product: product)
  end

  def add_to_cart(conn, %{"product_id" => product_id}) do
    product = Repo.get(Product, product_id)
    cart_item_changeset =
      Ecto.build_assoc(current_cart(conn), :cart_items)
        |> CartItem.changeset(%{"cart_id" => current_cart(conn).id, "product_id" => product.id})
    case Repo.insert(cart_item_changeset) do
      {:ok, _cart_item} ->
        conn
        |> put_flash(:info, "add to cart successfully.")
        |> redirect(to: product_path(conn, :index))
      {:error, _changeset} ->
        render(conn, "index.html")
    end
  end

end
