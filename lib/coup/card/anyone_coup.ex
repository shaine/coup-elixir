defmodule Coup.Card.AnyoneCoup do
  alias Coup.Player

  @card_name "Anyone"
  @action_name "Coup"
  @action_description "Choose player to lose a card"
  @counteracts_card nil
  @counteraction_description "None"

  use Coup.Card.BaseCard

  def validate_action(%Player{coin_count: coin_count}) when coin_count >= 7, do: {:ok}
  def validate_action(%Player{}), do: {:error, "Not enough coins to coup!"}

  def act(acting_player), do: lose_coins(acting_player, 7)
end
