defmodule Coup.Game do
  alias __MODULE__
  alias Coup.Card.{
    Ambassador,
    Assassin,
    Captain,
    Contessa,
    Duke
  }
  alias Coup.Turn

  defstruct [
    players: [],
    deck: []
  ]

  def start_game(players) do
    setup_game(players) |> Turn.take_turn
  end

  defp setup_game(players) do
    %Game{
      deck: build_deck |> Enum.shuffle,
      players: players |> Enum.shuffle
    }
  end

  defp build_deck do
    [
      Ambassador,
      Ambassador,
      Ambassador,
      Assassin,
      Assassin,
      Assassin,
      Captain,
      Captain,
      Captain,
      Contessa,
      Contessa,
      Contessa,
      Duke,
      Duke,
      Duke
    ]
  end
end
