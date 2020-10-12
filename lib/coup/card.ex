defmodule Coup.Card do
  def counteracts?(action_card, target_card), do: action_card.counteracts == target_card
end
