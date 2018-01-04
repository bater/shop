defmodule ShopWeb.ProductView do
  use ShopWeb, :view
  def present?(photo) do
    photo.file_name != ""
  end
end
