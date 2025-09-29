#!/bin/bash

# cotton candy rainbow??
gradient_1() {
  cleanup() {
    tput cnorm
    tput rmcup
    exit 0
  }
  trap cleanup SIGINT
  
  tput smcup
  clear
  tput civis
  t=1
  lines=20
  while true; do
    for i in $(seq 0 $((lines-1))); do
      phase=$((t + i * 20))
      R=$(( 128 + 100 * ((phase % 120 < 60) ? (phase % 60) : (60 - (phase % 60))) / 60 ))
      G=$(( 128 + 100 * (((phase + 40) % 120 < 60) ? ((phase + 40) % 60) : (60 - ((phase + 40) % 60))) / 60 ))
      B=$(( 128 + 100 * (((phase + 80) % 120 < 60) ? ((phase + 80) % 60) : (60 - ((phase + 80) % 60))) / 60 ))
      tput cup $i 0

      printf "\033[1;38;2;%d;%d;%dmThis is soooo cool right?\033[0m" "$R" "$G" "$B"
    done
  
    t=$((t + 2))
    if (( t >= 120 )); then
      t=0
    fi

    sleep 0.005

  done
}

gradient_1
