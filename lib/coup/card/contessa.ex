defmodule Coup.Card.Contessa do
  alias Coup.Card.Assassin

  @card_name "Contessa"
  @action_name "None"
  @action_description "None"
  @counteracts_card Assassin
  @counteraction_description "Blocks assassination"

  use Coup.Card.BaseCard

  def validate_action(_), do: {:error, "Contessa cannot take an action"}

  def preact(_acting_player), do: :noop

  def act(_), do: :noop
end
