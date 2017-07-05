<?php

class ModelExtensionModuleB5bQoreEngine extends Model{

	public function enableTheme($theme_name){
		$this->db->query("UPDATE " . DB_PREFIX . "b5b_qore_engine_settings SET value = '" . (string)$theme_name . "' WHERE name = 'active_theme'");
	}

	public function createSchema(){
		$this->db->query("
			CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "b5b_qore_engine_settings` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`name` varchar(255) NOT NULL,
			`value` text NOT NULL,
			PRIMARY KEY (`id`)
			) ENGINE=InnoDB  DEFAULT CHARSET=utf8;");

		// Set default_opencart_theme as default theme
		$this->db->query("INSERT INTO " . DB_PREFIX . "b5b_qore_engine_settings SET name = 'active_theme', value = 'default_opencart_theme'");
	}

	public function deleteSchema(){
		// NOTE: No need for Admin Theme Engine to check if the theme is active because it will automatically remove the table and the XML file will be disabled with a "_" at its end. It will do this for all items with "b5b_qore_engine_" at the beginning & ends with ".xml" and "b5b_qore_engine.xml"
		
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "b5b_qore_engine_settings`;");
	}

	private function checkEntry($column_name, $row_value){
		return $this->db->query("SELECT EXISTS(SELECT 1 FROM " . DB_PREFIX . "b5b_qore_engine_settings WHERE " . $column_name . " = `" . $row_value . "`)");
	}
}