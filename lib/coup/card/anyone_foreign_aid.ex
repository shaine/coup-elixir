defmodule Coup.Card.AnyoneForeignAid do
  @card_name "Anyone"
  @action_name "Foreign Aid"
  @action_description "Take 2 coins"
  @counteracts_card nil
  @counteraction_description "None"

  use Coup.Card.BaseCard

  alias Coup.Turn

  def validate_action(_acting_player), do: {:ok}

  def preact(_acting_player), do: :noop

  def act(%Turn{player: player}), do: gain_coins(player, 2)
end
