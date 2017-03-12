defmodule Woulette.User do
  use Woulette.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :email, :string
    field :phone, :string
    field :total_score, :integer

    has_many :user_bets, Woulette.UserBet
    has_many :bets, through: [:user_bets, :bet]

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :email, :phone, :total_score])
    |> validate_required([:name, :username, :email, :phone, :total_score])
  end
end
