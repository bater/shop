defmodule ShopWeb.CartController do
  use ShopWeb, :controller

  def current_cart(conn) do
    conn.assigns.current_cart
  end
end
