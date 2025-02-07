#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals+opponent_goals) FROM games")"
echo

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"
echo

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),2) FROM games")"
echo

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals+opponent_goals) FROM games")"
echo

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "select max(winner_goals) from games")"
echo

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "select count(*) from games where winner_goals >2")"
echo

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select name from games as g full join teams as t on t.team_id=g.winner_id where year=2018 and round='Final'")"
echo

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "select name from games as g full join teams as t on t.team_id=g.winner_id or t.team_id=g.opponent_id where year=2014 and round='Eighth-Final' order by name")"
echo

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select distinct(name) from games as g left join teams as t on t.team_id=g.winner_id  order by name")"
echo

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "select year,name from games as g full join teams as t on t.team_id=g.winner_id where round='Final' order by year")"
echo

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "select name from teams where name like 'Co%'")"
echo
