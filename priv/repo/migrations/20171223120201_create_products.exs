defmodule Shop.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string, null: false
      add :description, :text, null: false
      add :quantity, :integer, null: false
      add :price, :integer, null: false

      timestamps()
    end

  end
end
