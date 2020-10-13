defmodule Coup.Card.BaseCard do
  defmacro __using__(_opts) do
    quote do
      alias Coup.Player

      def name, do: @card_name
      def action_name, do: @action_name
      def action_description, do: @action_description
      def counteracts, do: @counteracts_card
      def counteraction_description, do: @counteraction_description

      def counteracts?(action_card, target_card), do: action_card.counteracts == target_card

      defp gain_coins(%Player{coin_count: coin_count} = player, coin_count) do
        %Player{player | coin_count: coin_count + coin_count}
      end

      defp lose_coins(%Player{coin_count: coin_count} = player, coin_count) do
        %Player{player | coin_count: coin_count - coin_count}
      end
    end
  end
end
