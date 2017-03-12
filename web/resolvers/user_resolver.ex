defmodule Woulette.UserResolver do
  alias Woulette.{Repo, User}
  def all(_args, _info) do
    {:ok, Repo.all(User) |> Repo.preload([{:user_bets, :bet}]) }
  end
end