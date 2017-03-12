defmodule Woulette.Repo.Migrations.CreateUserBet do
  use Ecto.Migration

  def change do
    create table(:user_bets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :bet_date, :date
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :bet_id, references(:bets, on_delete: :nothing, type: :binary_id)

      timestamps()
    end
    create index(:user_bets, [:user_id])
    create index(:user_bets, [:bet_id])

  end
end
