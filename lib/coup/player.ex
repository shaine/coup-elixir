defmodule Coup.Player do
  defstruct [
    :name,
    isk_count: 2,
    cards: []
  ]

  def take_turn(%Player = player) do
    select_card_action(player)
      validate_action
      select_action_target
    request_action_challenge
    pay_for_action
    request_action_block
    take_action
    request_target_result
  end
end
