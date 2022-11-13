#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
echo "Enter your username:"

# Get Input username
  read USERNAME

  # Insert into trace
  # USERNAME_TRACE_INSERT=$($PSQL "insert into username_trace(username) values('$USERNAME')")

  # Check username on DB
  USER_ID=$($PSQL "select user_id from users where username='$USERNAME'")

# Create guessing
  GUESS_PROCESSING(){
    # Param 1: for user_id
    # Param 2: for username
    # Param 3: for Number to be guessed
    # Param 4: new game or game_id flag
    # Param 5: Message
    # Param 6 : number_of_guess
    # if Not correct 

    # Show Message
    if [[ $5 ]]
        then 
          echo -e "$5"
          # echo -e "\n$3"
    fi

    # Read input guess from user
     read GUESS_NUMBER

    # Check if user input is not an integer
    if ! [[ "$GUESS_NUMBER" =~ ^[0-9]+$ ]]
      then
      # re-start proses again
      GUESS_PROCESSING "$1" "$2" "$3" "$4" "That is not an integer, guess again:" "$6"

      else
        # Lets match the guess
        MATCH_DIFF=$(($3 - $GUESS_NUMBER))

        # insert into history
        # INSERT_HISTORY_RESULT=$($PSQL "insert into guess_history(game_id, user_id, guess_number) values($4, $1, $GUESS_NUMBER)")

        # If lower
        if [[ $MATCH_DIFF -gt 0 ]]
         then 
          # Update total_guess 
          # UPDATE_TOTAL_GUESS_RESULT=$($PSQL "update games set total_guess = total_guess+1 where game_id=$4")

          # Redirect to start guessing again
          GUESS_PROCESSING "$1" "$2" "$3" "$4" "It's higher than that, guess again:" "$(($6+1))"

        elif [[ $MATCH_DIFF -lt 0 ]]
         then 
          # Update total_guess 
          #UPDATE_TOTAL_GUESS_RESULT=$($PSQL "update games set total_guess = total_guess+1 where game_id=$4")

          # Redirect to start guessing again
          GUESS_PROCESSING "$1" "$2" "$3" "$4" "It's lower than that, guess again:" "$(($6+1))"
        else
          # Update total_guess
          # UPDATE_TOTAL_GUESS_RESULT=$($PSQL "update games set total_guess = total_guess+1 where game_id=$4")

          # Update status game
          # UPDATE_IS_CORRECT_RESULT=$($PSQL "update games set is_correct = true where game_id=$4")

          number_of_guesses=$(($6+1))
          secret_number=$3
          # echo "You guessed it in $(echo $number_of_guesses | sed -r 's/ //g') tries. The secret number was $secret_number. Nice job!";
          echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!";
          # $(echo $SERVICE_NAME | sed -r 's/= //g') -- 

          # Get best_score
          BEST_GAME=$($PSQL "select best_game from users where username='$2' ")
          #echo $BEST_GAME
          
          # If Current guess is better then db
          if [[ $BEST_GAME =~ 0 ]] 
            then
            #echo "Line83"
            # Update DB
            UPDATE_BEST_GAME_RESULT=$($PSQL "update users set best_game="$number_of_guesses" where username='$2' ")
          elif [[ $number_of_guesses -lt $BEST_GAME ]]
            then
            # Update DB
            UPDATE_BEST_GAME_RESULT=$($PSQL "update users set best_game="$number_of_guesses" where username='$2' ")
          
          fi
        fi
    fi

    


  }

# Create function for flow of game
  GAME(){
    # If there is a parameter from outside
    # if [[ $4 ]]
      # Then echo the message
      # then echo -e "\n$4"
    # fi

    # If there's flag continue
      #if [[ "$3" ==  "Continue" ]]
        #then GUESSING ""

    # Generate random number between 1-1000
      # NUMBER=$((1 + $RANDOM % 1000))
      NUMBER=$((1 + $RANDOM % 20))
      # Make sure the number for guessing is well generated
        # echo $NUMBER
    
    # Create or insert new game on db
      # INSERT_GAME_RESULT=$($PSQL "insert into games(user_id, number) values ($2, $NUMBER)")

    # Update game_played
      UPDATE_GAME_PLAYED=$($PSQL "update users set games_played = games_played + 1 where user_id = $2")

    # Get game_id 
      # GAME_ID=$($PSQL "select g.game_id from games g where g.user_id=$2 and g.number=$NUMBER order by g.game_id desc limit 1")

    # Show welcoming message 1
      echo -e "\n$4"

    # Show welcoming message 2
      # echo -e "\nGuess the secret number between 1 and 1000:"

    # 1. user_id, 2. username, 3.number to be guessed, 4.user number, 5.flag
      GUESS_PROCESSING "$2" "$3" "$NUMBER" "$GAME_ID" "Guess the secret number between 1 and 1000:" "0"


  }

  # if not found
  if [[ -z $USER_ID ]]
    then
      # Insert new username into users table
      INSERT_USER_RESULT=$($PSQL " insert into users(username) values('$USERNAME') ")

      # Get new user_id after inserted
      USER_ID=$($PSQL "select user_id from users where username='$USERNAME'")

      # Redirect into game function
      GAME "New game" "$USER_ID" "$USERNAME" "Welcome, $USERNAME! It looks like this is your first time here."     
    else 
      # Get user game history
      USER_GAME_PLAYED=$($PSQL "select games_played from users where username='$USERNAME' limit 1")
      USER_BEST_GAME=$($PSQL "select best_game from users where username='$USERNAME' limit 1")

      echo "Welcome back, $USERNAME! You have played $(echo $USER_GAME_PLAYED | sed -r 's/= //g') games, and your best game took $(echo $USER_BEST_GAME | sed -r 's/= //g') guesses."

      GAME "New game" "$USER_ID" "$USERNAME" 
      # $(echo $SERVICE_NAME | sed -r 's/= //g')

       # echo "$USER_HISTORY" | read GAMES_PLAYED BAR BEST_GAME
        # Directly put into game function
        # GAME "New game" "$USER_ID" "$USERNAME" "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
        # echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
      

      
  fi














# echo -e "\n";