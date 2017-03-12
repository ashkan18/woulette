defmodule Woulette.BetController do
  use Woulette.Web, :controller

  alias Woulette.Bet

  def index(conn, _params) do
    bets = Repo.all(Bet)
    render(conn, "index.html", bets: bets)
  end

  def new(conn, _params) do
    changeset = Bet.changeset(%Bet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bet" => bet_params}) do
    changeset = Bet.changeset(%Bet{}, bet_params)

    case Repo.insert(changeset) do
      {:ok, _bet} ->
        conn
        |> put_flash(:info, "Bet created successfully.")
        |> redirect(to: bet_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bet = Repo.get!(Bet, id)
    render(conn, "show.html", bet: bet)
  end

  def edit(conn, %{"id" => id}) do
    bet = Repo.get!(Bet, id)
    changeset = Bet.changeset(bet)
    render(conn, "edit.html", bet: bet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bet" => bet_params}) do
    bet = Repo.get!(Bet, id)
    changeset = Bet.changeset(bet, bet_params)

    case Repo.update(changeset) do
      {:ok, bet} ->
        conn
        |> put_flash(:info, "Bet updated successfully.")
        |> redirect(to: bet_path(conn, :show, bet))
      {:error, changeset} ->
        render(conn, "edit.html", bet: bet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bet = Repo.get!(Bet, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(bet)

    conn
    |> put_flash(:info, "Bet deleted successfully.")
    |> redirect(to: bet_path(conn, :index))
  end
end
