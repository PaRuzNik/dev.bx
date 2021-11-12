<?php

function printMessage(string $message)
{
	echo $message . "\n";
}

function escape(string $output): string
{
	return htmlspecialchars($output, ENT_QUOTES);
}

function formatTitle(string $text): string
{
	if (strlen($text) > 45)
	{
		$text = mb_substr($text, 0, (45 / 2) - 2) . '...';
	}

	return $text;
}

function formatMessage(string $text): string
{
	if (strlen($text) > 125)
	{
		$text = substr($text, strpos($text, ',', 3));
		$text = mb_substr($text, 0, 125) . '...';
	}

	return $text;
}

function getFileName($path): string
{
	return basename($path, ".php");
}