defmodule Coup.Card.Duke do
  alias Coup.Card.AnyoneForeignAid
  alias Coup.Turn

  @card_name "Duke"
  @action_name "Tax"
  @action_description "Take 3 coins"
  @counteracts_card AnyoneForeignAid
  @counteraction_description "Blocks foreign aid"

  use Coup.Card.BaseCard

  def validate_action(_), do: {:ok}

  def preact(_acting_player), do: :noop

  def act(%Turn{player: player} = turn, _deck) do
    %Turn{
      turn | player: gain_coins(player, 3)
    }
  end
end
