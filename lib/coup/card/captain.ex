defmodule Coup.Card.Captain do
  alias __MODULE__
  alias Coup.Player

  @card_name "Captain"
  @action_name "Steal"
  @action_description "Take 2 coins from another player"
  @counteracts_card Captain
  @counteraction_description "Blocks stealing"

  use Coup.Card.BaseCard

  def validate_action(_), do: {:ok}

  def preact(acting_player), do: :noop

  def act(_) do
  end

  defp top_2_cards(deck), do: Enum.take(deck, 2)
end
