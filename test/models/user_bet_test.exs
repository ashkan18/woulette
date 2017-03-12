defmodule Woulette.UserBetTest do
  use Woulette.ModelCase

  alias Woulette.UserBet

  @valid_attrs %{bet_date: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserBet.changeset(%UserBet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserBet.changeset(%UserBet{}, @invalid_attrs)
    refute changeset.valid?
  end
end
