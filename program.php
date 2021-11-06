<?php

include("movies.php");
include("operationsOnMovies.php");

echo "Enter age:";
$age = readline("\n");

if (((int)$age >= 0) && ((int)$age < 120) && (is_numeric($age)))
{
	printSortedMoviesByAge((int)$age, $movies);
}
else
{
	echo "Not correct age";
}