defmodule Coup.Card.Assassin do
  # A turn is comprised of the following steps:
  # - Player chooses an action and if applicable a target
  # - The game announces the action, target, and description
  # - Each player selects whether they will challenge, or counteract
  # - If a player choose a counteraction, a new action flow is initiated
  # - If the player chooses to challenge, the acting player choose a card to discard
  # - If the discarded card matches the action, the challenging player chooses a card to discard and the original player receives a new card
  # - If the card matched, the action's result goes through
  def validate_action(%Player{isk_count: isk_count} = player) when isk_count >= 3, do: {:ok}
  def validate_action(%Player{isk_count: isk_count} = player), do: {:error, "Not enough isk to assassinate!"}

  def act(acting_player, target_player) do
    {:ok, charge_3_isk(acting_player)}
  end

  def counteract(_counteracting_player, _acting_player), do: {:error, "Assassin has no counteractions"}

  defp charge_3_isk(%Player{isk_count: isk_count} = player), do: %Player{player | isk_count: isk_count - 3}
end
