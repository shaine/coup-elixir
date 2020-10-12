defmodule Coup.Card.Assassin do
  alias Coup.Player

  @card_name "Assassin"
  @action_name "Assassinate"
  @action_description "Pay 3 coins, choose player to lose a card"
  @counteracted_card nil
  @counteraction_description "None"

  use Coup.Card.BaseCard

  def validate_action(%Player{isk_count: isk_count}) when isk_count >= 3, do: {:ok}
  def validate_action(%Player{}), do: {:error, "Not enough isk to assassinate!"}

  def preact(acting_player), do: charge_3_isk(acting_player)

  def act(_), do: :noop

  defp charge_3_isk(%Player{isk_count: isk_count} = player), do: %Player{player | isk_count: isk_count - 3}
end
