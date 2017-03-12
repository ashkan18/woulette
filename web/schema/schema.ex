defmodule Woulette.Schema do
  use Absinthe.Schema
  import_types Woulette.Schema.Types

  query do
    field :users, list_of(:user) do
      resolve &Woulette.UserResolver.all/2
    end
  end
end