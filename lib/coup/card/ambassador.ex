defmodule Coup.Card.Ambassador do
  alias Coup.Player
  alias Coup.Card.Captain

  @card_name "Ambassador"
  @action_name "Exchange"
  @action_description "Take 2 cards, then return 2 cards to the court deck"
  @counteracts_card Captain
  @counteraction_description "Blocks stealing"

  use Coup.Card.BaseCard

  def validate_action(_), do: {:ok}

  def preact(acting_player), do: :noop

  def act(_) do
  end

  defp top_2_cards(deck), do: Enum.take(deck, 2)
end
