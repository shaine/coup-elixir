defmodule Coup.Card.AnyoneIncome do
  @card_name "Anyone"
  @action_name "Income"
  @action_description "Take 1 coin"
  @counteracts_card nil
  @counteraction_description "None"

  use Coup.Card.BaseCard

  alias Coup.Turn

  def validate_action(_acting_player), do: {:ok}

  def preact(_acting_player), do: :noop

  def act(%Turn{player: player}, _deck), do: gain_coins(player, 1)
end
