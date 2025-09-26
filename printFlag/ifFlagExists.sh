if [ -f flag.txt ]; then
  echo "flag exists. Contents:"
  cat "flag.txt"
elif [ -f FLAG.txt ]; then
  echo "FLAG exists. Contents:"
  cat "FLAG.txt"
else
  echo "flag file not found."
fi
