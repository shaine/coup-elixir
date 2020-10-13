defmodule Coup.Card.Assassin do
  alias Coup.Player

  @card_name "Assassin"
  @action_name "Assassinate"
  @action_description "Pay 3 coins, choose player to lose a card"
  @counteracts_card nil
  @counteraction_description "None"

  use Coup.Card.BaseCard

  def validate_action(%Player{coin_count: coin_count}) when coin_count >= 3, do: {:ok}
  def validate_action(%Player{}), do: {:error, "Not enough coins to assassinate!"}

  def preact(acting_player), do: lose_coins(acting_player, 3)

  def act(_, _), do: :noop
end
