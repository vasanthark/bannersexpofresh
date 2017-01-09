<?php
class ModelTltBlogUrlAlias extends Model {
	public function getUrlAliasByKeyword($keyword) {
		$result = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog_url_alias WHERE keyword = '" . $this->db->escape($keyword) . "'");

		return $result->row;
	}

	public function getUrlAliasByQuery($query) {
		$result = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltblog_url_alias WHERE query = '" . $this->db->escape($query) . "'");

		return $result->row;
	}
}