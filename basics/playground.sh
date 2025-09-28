# experimenting with those things
echo "You are currently in $(pwd)"
echo {1..5} "<-- echo {1..5}"
# Input.. What does -p even mean?
read -p "First number: " a
read -p "Second number: " b

COLOR="\033[37;46;1m"
RESET="\033[0m"
echo
if [ $a -ge $b ]; then
  seq $b $a
  string="$b $a"
else
  seq $a $b
  string="$a $b"
fi

echo -e "${COLOR}^ seq $string ^${RESET}"

exit 0
