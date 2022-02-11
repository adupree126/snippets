#! /bin/bash

# copyChars - 2 gives --
copyChars() {
  OUT=""
  count=$2
  while (($count > 0)) ; do
    OUT=$OUT$1
    ((count--))
  done
  echo $OUT
}

updateErrText() {
  echo "here"
  num_bad=${#bad_guesses[@]}
  ERR_TEXT="[${bad_guesses[@]}"
  ERR_TEXT=$ERR_TEXT$(copyChars "--" $((MOVES - num_bad)))"]"
}

updateSuccessText(){
  echo "hoo"
}

updateText() {
  # update errtext
  updateErrText
  updateText
}


MOVES=${1:-6}
echo "A new game of hangman in $MOVES moves..."

LEN=7776    # length of word list
# get a random word
I=0
TARGET=$(($RANDOM%7776))
while read line < <(cat "words.txt"); do
  if ((I == TARGET)); then
    WORD=$line
    WORD_TEXT="_"
    break
  fi
  ((I++))
done;
# now for the game
bad_guesses=("a")
updateText
ERR_TEXT=[$(copyChars "--" $MOVES)]
WORD_TEXT=$(copyChars "_" ${#WORD})
echo "done with $WORD"
echo "$WORD_TEXT $ERR_TEXT"
