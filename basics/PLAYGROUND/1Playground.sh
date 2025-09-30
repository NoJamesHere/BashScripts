#!/bin/bash

# As you will be reading through this source code, you might come across something like this:
# (tl;1). This literally means: This line, character 1.
# But if you see something like (tl+2;1), that would mean: 2 lines after this line, character 1.
# Same goes for (tl-2;1): 2 lines before this line, character 1.
# okay have fun lol

# ---

# $EUID -eq 0 = root; is not 0 = not root. Easy
if [[ $EUID -eq 0 ]]; then
  echo "Why the hell are you running this via root?"
  exit 1
fi

# experimenting with those expansion (?) things
echo {1..5} "<-- echo {1..5}"

# Input.. What does -p even mean? Only know it's
# for input on the same line as echo (does this make sense?)
read -p "First number: " a
read -p "Second number: " b

# Colors. Only possible if running echo with -e, `echo -e "Whatever"`
HEADER="\033[1;4;38;5;208m"
BLUE="\033[30;46;1m"
YELLOW="\033[37;43;1m"
RESET="\033[0m"

echo

if [ $a -ge $b ]; then        # gt:  >  ; ge:  >=  ;  # makes sense. greater than (or then?), greater or equals,
  seq $b $a                   # lt:  <  ; le:  <=  ;  # less than, less or equals,
  string="$b $a"              #         ; eq:  ==  ;  # equals.
else
  seq $a $b
  string="$a $b"
fi

for i in {1..4}; do echo; done

echo -e "${BLUE}^ seq $string ^${RESET}"

# -- What is the difference between $VAL, ${VAL}, $(VAL), $((VAL))? --

echo; echo -e "${HEADER} How to use \$VAL.${RESET}"  # --- $VAL ---
                                                     #
name=Anonymous                                       # $V : This is a very basic concept. E.g. (tl;1) name and
echo; echo "Hello $name."                            # $V : Call it with `$name`. Easy.

echo; echo -e "${HEADER} How to use \${}.${RESET}"   # --- ${} ---
                                                     #
                                                     # ${} : For starters, it's needed for color ansi escape codes. otherwise it literally just prints `\033[whatever;1m`.
echo; echo -e "${YELLOW} ${name}_2025 ${RESET}"      # ${} : Also used for something like this (tl;6). Otherwise, if it were $name_2025, bash would literally think we meant
                                                     # ${} : a variable called name_2025, but we wanted to append "_2025" to the variable $name. Makes sense, right?
echo; echo "${name^^}, ${name,,}, ${name:5:8}"       # ${} : It also comes in handy when we need to do string operations, e.g. uppercasing it.


echo; echo -e "${HEADER} How to use \$().${RESET}"       # --- $() ---
                                                         #
time=$(date +"%H:%M")                                    #
echo; echo "$(pwd)"                                      # $() : This is for running commands and using the output out of it. example (tl;6).
echo; echo -e "Current Time: \033[1;37m${time}${RESET}"  # $() : Of course also works for variables in (tl-2;1).


echo; echo -e "${HEADER} How to use \$(()).${RESET}"         # --- $(()) ---
                                                             #
numA=5                                                       #
numB=2                                                       #
                                                             #
echo; echo "A:${numA} ; B:${numB}"                           # $(() : This is used to perform arithmetic calculations.
echo; echo "A+B: $((numA + numB))"                           # $(() : Here (tl;18) it calculates the sum of A and B.
((numB++))                                                   # $(() : On (tl;1) it increments B by 1, causing it now to
echo; echo "B++ ; B:${numB}"                                 # $(() : be 3 instead of the previous 2. (easy, right?)

# --- *more* if statements ---

# Here are some flags you should know about:
# * `-f filename`   ; file exists and is regular
# * `-d dirplace`   ; directory exists
# * `-z "$VAR"`     ; string is empty
# * `-n "$VAR"`     ; string is NOT empty
# * `==`            ; string equals (inside of `[[ ]]`)


dir=testfiles
file=${dir}/testFile.txt
content=$(cat "$file" 2>/dev/null)
str1=Hello
str2=hello
strEMPTY=""
echo; echo -e "${HEADER} How to use -d \$dir ${RESET}"; echo
if [[ -d $dir ]]; then
  echo "found $dir"
fi

echo; echo -e  "${HEADER} How to use -f \$file.${RESET}"; echo
if [[ -f $file ]]; then
  echo "${file}: ${content}"
fi

echo; echo -e "${HEADER} Using a loop for listing md files.${RESET}"; echo

shopt -s nullglob
for file in "$dir"/*.md; do
  echo "Found: $file"
done
shopt -u nullglob

echo; echo -e "${HEADER} How to use -z '\$VAR'${RESET}"; echo
if [[ -z "$strEMPTY" ]]; then
  echo "\$strEMPTY is, empty"
fi

echo; echo -e "${HEADER} How to use -n '\$VAR'${RESET}"; echo
if [[ -n "$str1" ]]; then
  echo "\$str1 is, guess what, not empty: ${str1}"
fi

echo; echo -e "${HEADER} How to use ==${RESET}"; echo
if [[ "$str1" == "$str2" ]]; then
  echo "wait what-"
else
  echo "Oh no! $str1 != $str2"; echo "\$str1: $str1"; echo "\$str2: $str2"
fi

# --- Arrays and Functions ---
# 1. Arrays
echo; echo -e "${HEADER} How to use arrays.${RESET}"; echo
fruits=("apple" "Banana" "cherry")
echo "First fruit: ${fruits[0]}"
echo "All fruits: ${fruits[@]}"
echo "Number of fruits: ${#fruits[@]}"

# 2. Functions
echo; echo -e "${HEADER} How to use functions.${RESET}"; echo
greet() {
  echo "Hello, $1!"
}

greet_multi() {
  echo "Hello $1, you brought $2."
}

greet "James"; echo
greet "Diana"; echo
greet "$name"; echo

greet_multi "James" "apples"; echo
greet_multi "Alice" "mangoes"; echo
greet_multi "dear" "your friends"; echo
greet_multi "Diana" "... Cherries. Diana.. I am allergic to cherries."; echo


exit 0
