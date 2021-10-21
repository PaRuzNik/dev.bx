<?php

require("movies.php");
require("operationsOnMovies.php");

echo "Enter age:";
$age = readline("\n");

if (((int) $age >= 0) && ((int) $age < 120) && (is_numeric((int)$age)))
{
	printSortedMoviesByAge((int)$age, $movies);
}
else
{
	echo "Not correct age";
}


