defmodule Shop.Goods.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias Shop.Goods.Product


  schema "products" do
    field :description, :string
    field :price, :integer
    field :quantity, :integer
    field :title, :string
    field :photo, :string, default: ""

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:title, :description, :quantity, :price])
    |> validate_required([:title, :description, :quantity, :price])
  end
end
