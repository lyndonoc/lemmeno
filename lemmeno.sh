# Associative arrays to store start time and command per shell session
typeset -Ag CMD_START_TIMES
typeset -Ag CMD_EXECUTED_CMDS

# Hook: Runs before a command is executed
preexec() {
  local pid="$$"
  CMD_START_TIMES[$pid]=$EPOCHREALTIME
  CMD_EXECUTED_CMDS[$pid]=$1
}

# Hook: Runs after the prompt is about to be shown again
precmd() {
  local pid="$$"
  local start_time="${CMD_START_TIMES[$pid]}"
  local command="${CMD_EXECUTED_CMDS[$pid]}"

  if [[ -n "$start_time" && -n "$command" ]]; then
    local end_time=$EPOCHREALTIME
    local duration=$(echo "$end_time - $start_time" | bc)

    # Use threshold from env, or default to 0.1s
    local threshold="${ZSH_COMMAND_TIMER_THRESHOLD:-5}"

    if (( $(echo "$duration > $threshold" | bc -l) )); then
      printf "[Command took %.3f seconds]\n" "$duration"
      say "$command is now complete"
    fi

    unset "CMD_START_TIMES[$pid]"
    unset "CMD_EXECUTED_CMDS[$pid]"
  fi
}

