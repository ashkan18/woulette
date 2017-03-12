defmodule Woulette.UserBetControllerTest do
  use Woulette.ConnCase

  alias Woulette.UserBet
  @valid_attrs %{bet_date: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, user_bet_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing user bets"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, user_bet_path(conn, :new)
    assert html_response(conn, 200) =~ "New user bet"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, user_bet_path(conn, :create), user_bet: @valid_attrs
    assert redirected_to(conn) == user_bet_path(conn, :index)
    assert Repo.get_by(UserBet, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_bet_path(conn, :create), user_bet: @invalid_attrs
    assert html_response(conn, 200) =~ "New user bet"
  end

  test "shows chosen resource", %{conn: conn} do
    user_bet = Repo.insert! %UserBet{}
    conn = get conn, user_bet_path(conn, :show, user_bet)
    assert html_response(conn, 200) =~ "Show user bet"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, user_bet_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    user_bet = Repo.insert! %UserBet{}
    conn = get conn, user_bet_path(conn, :edit, user_bet)
    assert html_response(conn, 200) =~ "Edit user bet"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    user_bet = Repo.insert! %UserBet{}
    conn = put conn, user_bet_path(conn, :update, user_bet), user_bet: @valid_attrs
    assert redirected_to(conn) == user_bet_path(conn, :show, user_bet)
    assert Repo.get_by(UserBet, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    user_bet = Repo.insert! %UserBet{}
    conn = put conn, user_bet_path(conn, :update, user_bet), user_bet: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit user bet"
  end

  test "deletes chosen resource", %{conn: conn} do
    user_bet = Repo.insert! %UserBet{}
    conn = delete conn, user_bet_path(conn, :delete, user_bet)
    assert redirected_to(conn) == user_bet_path(conn, :index)
    refute Repo.get(UserBet, user_bet.id)
  end
end
