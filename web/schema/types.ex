defmodule Woulette.Schema.Types do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :name, :string
    field :username, :string
    field :email, :string
    field :phone, :string
    field :user_bets, list_of(:user_bet)
  end

  object :user_bet do
    field :bet, :bet
    field :bet_date, :date
  end

  object :bet do
    field :name, non_null(:string)
    field :type, non_null(:string)
    field :score, non_null(:integer)
  end

  scalar :date do
    description "ISOz date",
    parse &Ecto.Date.cast/1
    serialize &Ecto.Date.to_string/1
  end
end