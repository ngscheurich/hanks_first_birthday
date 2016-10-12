defmodule HanksFirstBirthday.Repo.Migrations.CreateNote do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :from, :string
      add :body, :string

      timestamps()
    end

  end
end
