<?php

require_once('vendor/autoload.php');

class YouTubeVideo
{

    public $id; //id видео

    private $apiKey = 'AIzaSyDGKXvzugWSXbfkyEMjEqm-kNJJZLYmFJs';

    private $youtube;


    public function __construct() {
        $client = new Google_Client();
        $client->setDeveloperKey($this->apiKey);

        $this->youtube = new Google_Service_YouTube($client);
    }

    /*
    * Получение данных видео по их id
    */
    public function videosByIds( string $ids) {
        return $this->youtube->videos->listVideos('snippet, statistics, contentDetails', [
            'id' => $ids,
        ]);
    }

    /*
     * Поиск видео по фразе
     */
    public function search(string $q, int $maxResults = 5, string $lang = 'ru' ) {
        $response = $this->youtube->search->listSearch('id, snippet',
            array(
                'q' => $q,
                'maxResults' => $maxResults,
                'relevanceLanguage' => $lang,
                'type' => 'video'
            ));

        return $response;
    }

	/*
	* Получение данных о видео
	*/
	public function getDataVideo(array $videos) {
		$dataset = [];
		array_walk($videos, function ($value) use (&$dataset) {

			$dataset[] = [
				'id' => $value->toSimpleObject()->id->videoId,
				'title' => $value->toSimpleObject()->snippet->title,
				'thumbnail' => $value->toSimpleObject()->snippet->thumbnails->default->url,
				'published_at' => substr($value->toSimpleObject()->snippet->publishedAt, 0, -14)
			];
        });

        return $dataset;
    }
}

?>