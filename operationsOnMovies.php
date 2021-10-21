<?php

require ("movies.php");

function SortAgeByResult(int $age,array $movies):void
{

	$NumberInMovies = 1;
	foreach ($movies as $movie)
	{
		if ($movie["age_restriction"] <= $age)
			{

				echo "{$NumberInMovies}.".MovieFormat($movie)."\n";
				$NumberInMovies++;
			}
	}

}

function MovieFormat(array $movie) : string
{

	return "  {$movie['title']} ({$movie['release_year']}), 
	Age restriction {$movie['age_restriction']}+   Rating {$movie['rating']}";

}