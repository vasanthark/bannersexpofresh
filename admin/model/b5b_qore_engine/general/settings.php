<?php
class ModelB5bQoreEngineGeneralSettings extends Model {

	public function getSettings($settings_name) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "b5b_qore_engine_settings WHERE name = '" . $settings_name .  "'");

		return $query->row['value'];
	}

	public function getSettingsAll() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "b5b_qore_engine_settings");

		return $query->rows;
	}

	public function tableExsits($table_name){
		$query = $this->db->query("SELECT * FROM information_schema.tables WHERE table_schema = '" . DB_DATABASE . "' AND table_name = '" . DB_PREFIX . $table_name . "' LIMIT 1;");

		return $query->rows;

	}
}
