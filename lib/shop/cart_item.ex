defmodule Shop.CartItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias Shop.CartItem


  schema "cart_items" do
    belongs_to :cart, Shop.Cart
    belongs_to :product, Shop.Product

    timestamps()
  end

  @doc false
  def changeset(%CartItem{} = cart_item, attrs) do
    cart_item
    |> cast(attrs, [])
    |> validate_required([])
  end
end
