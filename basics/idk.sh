# experimenting with those things
echo "You are currently in $(pwd)"
echo {1..5} "<-- echo {1..5}"
# Input.. What does -p even mean?
read -p "First number: " a
read -p "Second number: " b


echo
echo {${a}..${b}}
seq $a $b
