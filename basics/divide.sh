#!/bin/bash

if command -v bc >/dev/null 2>&1; then
  read -p "Num1: " a
  read -p "Num2: " b
  if [[ $b -eq 0 ]]; then
    echo "Cannot divide by 0."
    exit 0
  fi
  result=$(echo "scale=2; $a / $b" | bc)
  echo "Result: $result"
  
else
  echo "bc is not installed. For debian: sudo apt install bc"
  exit 1
fi

