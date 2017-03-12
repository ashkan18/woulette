defmodule Woulette.Bet do
  use Woulette.Web, :model

  schema "bets" do
    field :name, :string
    field :type, :string
    field :score, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :type, :score])
    |> validate_required([:name, :type, :score])
  end
end
