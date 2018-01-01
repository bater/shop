defmodule Shop.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do

      timestamps()
    end

  end
end
