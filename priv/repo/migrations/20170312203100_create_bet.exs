defmodule Woulette.Repo.Migrations.CreateBet do
  use Ecto.Migration

  def change do
    create table(:bets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :type, :string
      add :score, :integer

      timestamps()
    end

  end
end
