defmodule ShopWeb.LayoutView do
  use ShopWeb, :view
  import ShopWeb.CartController, only: [current_cart: 1]

  def cart_item_count(conn) do
    Shop.Repo.preload(current_cart(conn), :cart_items).cart_items
      |> length
  end

end
