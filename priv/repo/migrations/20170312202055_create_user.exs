defmodule Woulette.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :username, :string
      add :email, :string
      add :phone, :string
      add :total_score, :integer

      timestamps()
    end

  end
end
