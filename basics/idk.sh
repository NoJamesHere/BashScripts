currentTime=$(date +"%H")


if [[ $currentTime -ge 0 && $currentTime -lt 3 ]]; then
  time="night"
elif [[ $currentTime -ge 3 && $currentTime -lt 6 ]]; then
  time="early morning"
elif [[ $currentTime -ge 6 && $currentTime -lt 9 ]]; then
  time="morning"
elif [[ $currentTime -ge 9 && $currentTime -lt 12 ]]; then
  time="forenoon"
elif [[ $currentTime -eq 12 ]]; then
  time="noon"
elif [[ $currentTime -ge 13 && $currentTime -lt 17 ]]; then
  time="afternoon"
elif [[ $currentTime -ge 17 && $currentTime -lt 20 ]]; then
  time="evening"
else
  time="night"
fi

echo "Good $time"


# i hate this- I love my life and absolutely also love learning bash :,)
