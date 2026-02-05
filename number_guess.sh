#!/bin/bash
# modifica 1
#modifica 2
# modifica 3
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$((1 + $RANDOM % 1000))

# prompt for username and take usernae ad input

echo "Enter your username:"
read USERNAME

# verifico se utente esiste

USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  IS_NEW_USER=true
else
  GAMES_PLAYED=$(echo $USER_DATA | cut -d '|' -f 1)
  BEST_GAME=$(echo $USER_DATA | cut -d '|' -f 2)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  IS_NEW_USER=false
fi


# ecco che il gioco inizia

echo "Guess the secret number between 1 and 1000:"
read GUESS


# conteggio dei tentativi 
GUESSES=1

# loop finché non indovina

while [[ $GUESS -ne $SECRET_NUMBER ]] 2>/dev/null || [[ ! $GUESS =~ ^[0-9]+$ ]]
do
	if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
	 echo "That is not an integer, guess again:"
	 read GUESS
	 continue
        fi

	if [[ $GUESS -gt $SECRET_NUMBER ]]; then
	 echo "It's lower than that, guess again:"
        else
	 echo "It's higher than that, guess again:"
	fi
	read GUESS
	((GUESSES++))
done

echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"



if [[ $IS_NEW_USER == true ]]; then
 INSERT_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $GUESSES)")
else
 UPDATE_GAMES=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USERNAME'")


 CURRENT_BEST=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
 if [[ -z $CURRENT_BEST ]] || [[ $GUESSES -lt $CURRENT_BEST ]]; then
  UPDATE_BEST=$($PSQL "UPDATE users SET best_game = $GUESSES WHERE username='$USERNAME'")
 fi
fi

