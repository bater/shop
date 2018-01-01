defmodule Shop.Cart do
  use Ecto.Schema
  import Ecto.Changeset
  alias Shop.Cart


  schema "carts" do
    has_many :cart_items, Shop.CartItem, on_delete: :delete_all
    has_many :products, through: [:cart_items, :product]

    timestamps()
  end

  @doc false
  def changeset(%Cart{} = cart, attrs) do
    cart
    |> cast(attrs, [])
    |> validate_required([])
  end
end
