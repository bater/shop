defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  alias Shop.Goods
  alias Shop.Goods.Product

  def index(conn, _params) do
    products = Goods.list_products()
    render(conn, "index.html", products: products)
  end

  def show(conn, %{"id" => id}) do
    product = Goods.get_product!(id)
    render(conn, "show.html", product: product)
  end

end
