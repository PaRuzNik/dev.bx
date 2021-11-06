<?php

require("movies.php");

function printSortedMoviesByAge(int $age, array $movies): void
{
	$NumberInMovies = 1;
	foreach ($movies as $movie)
	{
		if ($movie["age_restriction"] <= $age)
		{
			echo "{$NumberInMovies}." . formatMovie($movie) . "\n";
			$NumberInMovies++;
		}
	}
}

function formatMovie(array $movie): string
{
	return "  {$movie['title']} ({$movie['release_year']}), {$movie['age_restriction']}+. - Rating {$movie['rating']}";
}