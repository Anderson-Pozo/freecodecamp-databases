#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN_MENU(){
  if [[ -n $1 ]]
  then
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      QUERY_CONDITION="e.atomic_number=$1"
    else
      QUERY_CONDITION="e.symbol='$1' OR e.name='$1'"
    fi

    ELEMENT_RESULT=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type 
      FROM elements e 
      INNER JOIN properties p USING(atomic_number) 
      INNER JOIN types t USING(type_id) 
      WHERE $QUERY_CONDITION")
    
    if [[ -z $ELEMENT_RESULT ]]
    then
      echo "I could not find that element in the database."
    else
      IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$ELEMENT_RESULT"

      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    fi
  else
    echo -e "Please provide an element as an argument."
  fi
}

MAIN_MENU "$1"