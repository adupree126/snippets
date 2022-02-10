#! /bin/bash
MOVES=${1:-6}
ERR_TEXT="[]"
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
WORD_TEXT="_"

echo "done with $WORD"
