defmodule Woulette.UserTest do
  use Woulette.ModelCase

  alias Woulette.User

  @valid_attrs %{email: "some content", name: "some content", phone: "some content", total_score: 42, username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
