X=$2
Y=$3
HORIZ=$(($1 % 2))
SIGN=1
if [ $1 -gt 1 ]; then SIGN=-1; fi

for i in $(seq $4)
do
  vim -n -e +$Y "+ normal $X|rX" -c wq -f proc1 1>/dev/null
  if [ $HORIZ -eq 0 ]; then X=$(($X+$SIGN)); else Y=$(($Y+$SIGN)); fi
done
if [ $HORIZ -eq 0 ]; then X=$(($X- $SIGN)); else Y=$(($Y- $SIGN)); fi

echo "$((($1+1) % 4)) $X $Y";
