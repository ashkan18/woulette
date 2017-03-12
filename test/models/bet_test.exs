defmodule Woulette.BetTest do
  use Woulette.ModelCase

  alias Woulette.Bet

  @valid_attrs %{name: "some content", score: 42, type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Bet.changeset(%Bet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Bet.changeset(%Bet{}, @invalid_attrs)
    refute changeset.valid?
  end
end
