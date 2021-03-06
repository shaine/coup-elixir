defmodule Coup.Turn do
  alias __MODULE__
  alias Coup.Player
  alias Coup.Game

  defstruct [
    :error,
    :player,
    :card,
    :target_player,
    :challenging_player,
    :counteracting_player,
    :counteracting_card,
    :counteraction_challenging_player,
    :challenger_discarded_card,
    :action_result, # succeeded, failed
    :action_challenge_result, # succeeded, failed
    :counteracount_result, # succeeded, failed
    :counteraction_challenge_result, # succeeded, failed
    target_cards: []
  ]

  def start_turn(game) do
    start_turn(game, 0)
  end

  def start_turn(%Game{deck: deck, players: players} = game, player_index) do
    Enum.at(players, player_index)
    |> start_turn
    |> select_card_action
    |> validate_action
    |> notify_player_error
    |> select_action_target
    |> request_action_challenge
    |> take_preaction
    |> request_action_counteract
    |> take_action(deck)
    |> request_target_result
    |> send_summary
    |> commit_turn_to_game(game)
    |> next_turn(game)
  end

  defp new_turn(player) do
    %Turn{
      player: player
    }
  end

  # TODO Ask the user to pick a card
  defp select_card_action(turn) do
    %Turn{}
  end

  defp validate_action(turn) do
    case turn.card.validate_action(turn.player) do
      {:ok} -> turn
      {:error, message} -> %Turn{turn | error: message}
      _ -> %Turn{turn | error: "Unknown validation status"}
    end
  end

  # TODO Validate the selected action
  defp notify_player_error(turn), do: turn

  # TODO Have the player select the action target
  defp select_action_target(turn), do: turn

  # TODO Have the other players elect to challenge
  defp request_action_challenge(turn), do: turn

  defp take_preaction(turn), do: %Turn{ turn | player: turn.card.preact(turn.player) }

  # TODO Have the other players elect to counteract
  defp request_action_counteract(turn), do: turn

  defp take_action(turn, deck), do: turn.card.act(turn, deck)

  # TODO Have the targeted player pick the target card if applicable
  defp request_target_result(turn), do: turn

  # TODO Print a summary of the turn to all users
  defp send_summary(turn), do: turn

  defp commit_turn_to_game(turn, game) do
  end

  defp next_turn(turn, game) do
    Game.next_player(turn.player, game)
    |> take_turn(game)
  end
end
