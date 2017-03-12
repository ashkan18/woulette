defmodule Woulette.BetControllerTest do
  use Woulette.ConnCase

  alias Woulette.Bet
  @valid_attrs %{name: "some content", score: 42, type: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, bet_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing bets"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, bet_path(conn, :new)
    assert html_response(conn, 200) =~ "New bet"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, bet_path(conn, :create), bet: @valid_attrs
    assert redirected_to(conn) == bet_path(conn, :index)
    assert Repo.get_by(Bet, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, bet_path(conn, :create), bet: @invalid_attrs
    assert html_response(conn, 200) =~ "New bet"
  end

  test "shows chosen resource", %{conn: conn} do
    bet = Repo.insert! %Bet{}
    conn = get conn, bet_path(conn, :show, bet)
    assert html_response(conn, 200) =~ "Show bet"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, bet_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    bet = Repo.insert! %Bet{}
    conn = get conn, bet_path(conn, :edit, bet)
    assert html_response(conn, 200) =~ "Edit bet"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    bet = Repo.insert! %Bet{}
    conn = put conn, bet_path(conn, :update, bet), bet: @valid_attrs
    assert redirected_to(conn) == bet_path(conn, :show, bet)
    assert Repo.get_by(Bet, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    bet = Repo.insert! %Bet{}
    conn = put conn, bet_path(conn, :update, bet), bet: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit bet"
  end

  test "deletes chosen resource", %{conn: conn} do
    bet = Repo.insert! %Bet{}
    conn = delete conn, bet_path(conn, :delete, bet)
    assert redirected_to(conn) == bet_path(conn, :index)
    refute Repo.get(Bet, bet.id)
  end
end
