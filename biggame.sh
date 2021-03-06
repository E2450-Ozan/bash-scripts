#!/usr/bin/env bash
# A three-in-one game app
# The game definitions

guess() {
	local -i mynumber=$(( 1 + $RANDOM % 10 ))
	read -p "I'm thinking of a number bw 1 and 10. Guess what?" theguess
	if (( theguess == mynumber )); then
		echo "You got it! Congrats"; echo
	else
		echo "Nope. I was thinking $mynumber. Try it again!"; echo
	fi
	sleep 1
	choosegame
}

flip() {
	local -i mynumber=$(( 1 + $RANDOM % 2 ))
	if (( mynumber == 1 )); then
		local face="HEADS"
	else
		local face="TAILS"
	fi
	printf "I flipped a coin and it was: %s\n\n" $face
	sleep 1
	choosegame	
}

dice() {
	local -i mynumber=$(( 1 + $RANDOM % 6 ))
	local -i mynumber2=$(( 1 + $RANDOM % 6 ))
	printf "I rolled two dice and the results are: %s and %s. \n\n $mynumber $mynumber2
	sleep 1
	choosegame	
}

# The game chooser
choosegame(){
	select game in "Guessing Game" "Flip a Coin" "Dice Roll" "Exit"
	do
		case $game in
			"Guessing Game") guess;;
			"Flip a Coin") flip;;
			"Dice Roll") dice;;
			"Exit") exit;;
			*) echo "Please choose from the menu";;
		esac
	done 
}

# If there is an argument provided, jump right to that game. Otherwise, show game choose menu.
case $1 in
	"guess") guess;;
	"flip") flip;;
	"dice") dice;;
	*) choosegame;;
esac
