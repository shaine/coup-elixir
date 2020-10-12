defmodule Coup.Turn do
  defstruct [
    :player,
    :target_player,
    :card,
    :challenging_player,
    :counteracting_player,
    :counteracting_card,
    :counteraction_challenging_player,
    :challenged_card,
    :challenger_discarded_card,
    :action_result, # succeeded, failed
    :action_challenge_result, # succeeded, failed
    :counteracount_result, # succeeded, failed
    :counteraction_challenge_result # succeeded, failed
  ]
end
