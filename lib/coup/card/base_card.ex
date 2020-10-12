defmodule Coup.Card.BaseCard do
  defmacro __using__(_opts) do
    quote do
      def counteracts, do: @counteracted_card
      def action_name, do: @action_name
      def action_description, do: @action_description
      def counteraction_description, do: @counteraction_description
    end
  end
end
