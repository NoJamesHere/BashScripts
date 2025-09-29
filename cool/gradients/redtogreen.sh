#!/bin/bash


main() {
  cleanup() {
    tput cnorm
    tput rmcup
    exit 0
  }
  trap cleanup SIGINT

  tput smcup
  clear
  tput civis
  R=0
  G=255
  B=40
  i=0
  name=$(whoami)
  name=${name^^}
  while [[ $i -lt 100 ]]; do
    echo -e "\033[1;38;2;${R};${G};${B}mHELLO ${name}\033[0m"
    ((i++))
  done
  while true; do 
    while [[ $R -lt 255 ]]; do
      echo -e "\033[1;38;2;${R};${G};${B}mHELLO ${name}\033[0m"
      ((R++))
      ((G--))
      sleep 0.02
    done
    while [[ $R -gt 0 ]]; do
      echo -e "\033[1;38;2;${R};${G};${B}mHELLO ${name}\033[0m"
      ((R--))
      ((G++))
      sleep 0.02
    done
  done
}

main
