defmodule Woulette.UserBet do
  use Woulette.Web, :model

  schema "user_bets" do
    field :bet_date, Ecto.Date
    belongs_to :user, Woulette.User
    belongs_to :bet, Woulette.Bet

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:bet_date])
    |> validate_required([:bet_date])
  end
end
