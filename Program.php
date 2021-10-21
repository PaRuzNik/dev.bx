<?php

require ("movies.php");
require ("operationsOnMovies.php");


echo "Enter age:";
$age = readline("\n");

if (($age >= 0) and ($age < 120) and (is_numeric($age)))
{

	SortAgeByResult((int)$age, $movies);

}
else
{

	echo "Not correct age";

}


