defmodule Woulette.UserBetController do
  use Woulette.Web, :controller

  alias Woulette.UserBet

  def index(conn, _params) do
    user_bets = Repo.all(UserBet)
    render(conn, "index.html", user_bets: user_bets)
  end

  def new(conn, _params) do
    changeset = UserBet.changeset(%UserBet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_bet" => user_bet_params}) do
    changeset = UserBet.changeset(%UserBet{}, user_bet_params)

    case Repo.insert(changeset) do
      {:ok, _user_bet} ->
        conn
        |> put_flash(:info, "User bet created successfully.")
        |> redirect(to: user_bet_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_bet = Repo.get!(UserBet, id)
    render(conn, "show.html", user_bet: user_bet)
  end

  def edit(conn, %{"id" => id}) do
    user_bet = Repo.get!(UserBet, id)
    changeset = UserBet.changeset(user_bet)
    render(conn, "edit.html", user_bet: user_bet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_bet" => user_bet_params}) do
    user_bet = Repo.get!(UserBet, id)
    changeset = UserBet.changeset(user_bet, user_bet_params)

    case Repo.update(changeset) do
      {:ok, user_bet} ->
        conn
        |> put_flash(:info, "User bet updated successfully.")
        |> redirect(to: user_bet_path(conn, :show, user_bet))
      {:error, changeset} ->
        render(conn, "edit.html", user_bet: user_bet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_bet = Repo.get!(UserBet, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user_bet)

    conn
    |> put_flash(:info, "User bet deleted successfully.")
    |> redirect(to: user_bet_path(conn, :index))
  end
end
