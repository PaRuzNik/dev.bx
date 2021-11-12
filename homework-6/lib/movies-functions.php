<?php

function getMoviesByGenres(array $movies, string $genre): array
{
	return array_filter($movies, function($movie) use ($genre){
		return in_array($genre, $movie['genres']);
	});
}

function getMoviesById(array $movies, int $id): array
{
	foreach ($movies as $movie)
	{
		if($movie['id'] === $id)
		{
			return $movie;
		}
	}
	return [];
}

function getGenreList(array $genres): string
{
	$result = '';
	foreach ($genres as $genre)
	{
		$result	.= $genre . ", ";
	}

	$result = mb_substr( $result,0, -2, 'UTF-8');
	return mb_strlen($result, 'UTF-8') <= 30? $result : formatTitle($result);
}

function movieSquareRating(int $i, float $rating): string
{
	{
		if ($i<=$rating){
			return '<div style= "background:#E78818;"  class="rating-rectangle"></div>';
		}
		else
		{
			return '<div class="rating-rectangle"></div>';
		}
	}
}