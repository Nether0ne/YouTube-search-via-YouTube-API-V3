<?php

require_once("DataBase.php");

class DataManage {

	private $db;

	// Конструктор
	public function __construct() {
		// Подключение к БД
		$this->db = DataBase::getDataBase();
	}

	// Функция проверки наличия нужных видео
	public function search(string $search) {
		// Запрос к базе данных
		$query = "SELECT * FROM search WHERE query={?}";
		
		// Выполнение запроса к базе данных
		return $this->getDataSet($this->db->select($query, array($search)));
	}

	// Функция вставки результата в базу данных
	public function addDataSet(array $videos, string $search) {
		$date = new DateTime();
		$date = $date->format('Y-m-d');

		foreach ($videos as $v) {
			$id = $v['id'];
			$title = $v['title'];
			$published = DateTime::createFromFormat('Y-m-d', $v['published_at']); 
			$published = $published->format('Y-m-d');
			$img = $v['thumbnail'];

			$query = "INSERT INTO search VALUES (NULL, {?}, {?}, {?}, {?}, {?}, {?})";
			
			$this->db->query($query, array($search, $date, $id, $title, $published, $img));
		}
	}

	// Функция реобразования полученных данных
	public function getDataSet($result) {

		$dataset = [];

		// Если запрос вернул не 0 строк
		if (count($result)) {
			$user = new User();
			foreach($result as $v) {

				$dataset[] = [
					'id' => $v['videoid'],
					'title' => $v['title'],
					'published_at' => $v['published'],
					'thumbnail' => $v['img'],
					'liked' => $user->isLiked($v['videoid'])
				];
			}
		}
		// Если запрос вернул 0 строк
		else {
			$dataset = NULL;
		}

		// Возвращаем построенный ответ с базы данных
		return $dataset;
	}

	// Функция для удаления старых хранящихся данных в базе данных
	public function removeDataSet(string $search) {
		$query = "DELETE FROM search WHERE query={?}";

		return $this->db->query($query, array($search));
	}

}

?>