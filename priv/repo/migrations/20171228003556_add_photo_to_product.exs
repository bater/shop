defmodule Shop.Repo.Migrations.AddPhotoToProduct do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :photo, :string, default: ""
    end
  end
end
