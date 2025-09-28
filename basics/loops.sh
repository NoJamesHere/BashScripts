#!/bin/bash

# Note to fucking self: PLEASE change this
# after finishing the script cuz ISTFG-

if [[ $# -lt 1 ]]; then
  echo -e "Usage: ./script <number 1-?>\033[1m"
  echo -e "<1>: For loop in an array"
  echo -e "<2>: While loop"
  echo -e "<3>: For loop (.txt files)"
  echo -e "<4>: Step by step summation tracker"
  echo -e "\033[0m"
  exit 1
fi

function_one(){
  fruits=("banana" "apple" "orange")

  echo "${fruits[@]}"
  for fruit in "${fruits[@]}"; do
    echo "$fruit" 
  done
  exit 0
}

function_two() {
  count=1
  while [[ $count -lt 10 ]]; do
    echo "Number $count"
    ((count++))
  done
  exit 0
}

function_three() {
  for file in *.txt; do
    echo "FOUND: $file"
  done
  exit 0
}

function_four() {
  while [[ 1 -eq 1 ]]; do
    read -p "Enter a value: " i
    if [[ $i -lt 0 ]]; then
      echo "Enter a value bigger then 0"
      continue
    else
      break
    fi
  done
  res=0
  prev=0
  inc=0
  while [[ $inc -lt $i ]]; do
    ((inc++))
    ((res+=inc))
    echo -e "\033[1m$prev + $inc = $res\033[0m"
    ((prev=res))
  done
  echo -e "\033[1;38;5;200mResult: $res\033[0m"
}

function_five() {
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
case "$1" in
  1) function_one ;;
  2) function_two ;;
  3) function_three ;;
  4) function_four ;;
  5) function_five ;;
  *)
    echo "Not valid"; exit 0 ;;
esac


