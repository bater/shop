defmodule Shop.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :password, :string
      add :encrypted_password, :string
      add :email, :string, null: false

      timestamps()
    end
    create unique_index(:users, [:email])
  end
end
