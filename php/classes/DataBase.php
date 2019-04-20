<?php

class DataBase {
	
	private static $db = NULL; // Единственный экземпляр класса, чтобы не создавать множественные подключения
	private $mysqli; // Идентификатор соединения
	private $sym_query = "{?}"; // Символ значения в запросе


	// Получение экземпляра класса (Singleton)
	public static function getDataBase() {
		if (self::$db == null) {
			self::$db = new DataBase();
		}
		return self::$db;
	}

	// Private-конструктор подключения к базе данных, устанавливающий локаль и кодировку соединения
	private function __construct() {
		$this->mysqli = new mysqli("localhost", "root", "", "videosite");
		$this->mysqli->query("SET lc_time_names = 'ru_RU'");
		$this->mysqli->query("SET NAMES 'utf8'");
	}

	// Вспомогательный метод, который заменяет символ значения в запросе на конкретное значение, которое проходит через функции безопасности
	private function getQuery($query, $params) {
	    if ($params) {
	    	for ($i = 0; $i < count($params); $i++) {
	        	$pos = strpos($query, $this->sym_query);
	        	$arg = "'".$this->mysqli->real_escape_string($params[$i])."'";
	        	$query = substr_replace($query, $arg, $pos, strlen($this->sym_query));
	    	}
	    }
	    return $query;
  	}

	// SELECT-метод, возвращающий таблицу результатов
	public function select($query, $params = false) {
		$dataset = $this->mysqli->query($this->getQuery($query, $params));

		if (!$dataset) 
			return false;
    	return $this->dataSetToArray($dataset);
	}

	// SELECT-метод, возвращающий одну строку с результатом
	  public function selectRow($query, $params = false) {
	    $dataset = $this->mysqli->query($this->getQuery($query, $params));
	    if ($dataset->num_rows != 1) 
	    	return false;
	    else 
	    	return $dataset->fetch_assoc();
	  }

	  // SELECT-метод, возвращающий значение из конкретной ячейки 
	  public function selectCell($query, $params = false) {
	    $dataset = $this->mysqli->query($this->getQuery($query, $params));
	    if ((!$dataset) || ($dataset->num_rows != 1)) 
	    	return false;
	    else {
	      $arr = array_values($dataset->fetch_assoc());
	      return $arr[0];
	    }
	  }

	  // НЕ-SELECT методы (INSERT, UPDATE, DELETE). Если запрос INSERT, то возвращается id последней вставленной записи 
	  public function query($query, $params = false) {
	    $success = $this->mysqli->query($this->getQuery($query, $params));
	    if ($success) {
	      if ($this->mysqli->insert_id === 0) 
	      	return true;
	      else 
	      	return $this->mysqli->insert_id;
	    }
	    else 
	    	return false;
	  }

	  // Преобразование dataset в двумерный массив 
	  private function dataSetToArray($dataset) {
	    $array = array();
	    while (($row = $dataset->fetch_assoc()) != false) {
	      $array[] = $row;
	    }
	    return $array;
	  }

	  // При уничтожении объекта закрывается соединение с базой данных 
	  public function __destruct() {
	    if ($this->mysqli) $this->mysqli->close();
	  }

}
?>