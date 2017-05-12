<?php

/**
 * Class ModelToolSimpleRedirectMaster
 * @property DB $db
 */
class ModelToolSimpleRedirectMaster extends Model {

	public function __construct($registry) {
		parent::__construct($registry);

		$check = $this->db->query("SELECT COUNT(*) AS `store_id_exists` FROM `information_schema`.`COLUMNS` WHERE `TABLE_SCHEMA` = '" . $this->db->escape(DB_DATABASE) . "' AND `TABLE_NAME` = '" . DB_PREFIX . "srm_redirect' AND `COLUMN_NAME` = 'store_id'");

		if ($check->row['store_id_exists'] == 0) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "srm_redirect` ADD COLUMN `store_id` int NOT NULL DEFAULT '0' AFTER `code`");
		}
	}

	/**
     * @param array $data
     * @return array
     */
    public function getRedirects($data = array()) {
        $results = $this->db->query($this->getRedirectsSql($data));

	    $data = array();
	    
	    foreach ($results->rows as $row) {
		    $data[] = array(
			    'redirect_id' => (int)$row['redirect_id'],
			    'from' => $row['from'],
			    'to' => $row['to'],
			    'code' => (int)$row['code'],
			    'store_id' => isset($row['store_id']) ? (int)$row['store_id'] : 0,
			    'status' => (int)$row['status']
		    );
	    }
	    
	    return $data;
    }

    /**
     * @param array $data
     * @return int
     */
    public function getTotalRedirects($data = array()) {
        $results = $this->db->query($this->getRedirectsSql($data, true));

        return (int)$results->row['total'];
    }

    public function addRedirect($data) {
        $columns = array();
        $columns[] = "`from` = '" . $this->db->escape($data['from']) . "'";
        $columns[] = "`to` = '" . $this->db->escape($data['to']) . "'";

        if (isset($data['code']))
            $columns[] = "`code` = '" . (int)$data['code'] . "'";

        if (isset($data['status']))
            $columns[] = "`status` = '" . (int)(bool)$data['status'] . "'";

	    if (isset($data['store_id']))
	    	$columns[] = "`store_id` = '" . (int)$data['store_id'] . "'";

        $this->db->query("INSERT INTO `" . DB_PREFIX . "srm_redirect` SET " . implode(", ", $columns));

        return $this->db->getLastId();
    }

    /**
     * @param int $redirectId
     * @param array $data
     * @return int
     */
    public function editRedirect($redirectId, $data) {
        $columns = array();
        $columns[] = "`from` = '" . $this->db->escape($data['from']) . "'";
        $columns[] = "`to` = '" . $this->db->escape($data['to']) . "'";

        if (isset($data['code']))
            $columns[] = "`code` = '" . (int)$data['code'] . "'";

	    if (isset($data['store_id']))
		    $columns[] = "`store_id` = '" . (int)$data['store_id'] . "'";

	    if (isset($data['status']))
	        $columns[] = "`status` = '" . (int)(bool)$data['status'] . "'";

	    $this->db->query("UPDATE `" . DB_PREFIX . "srm_redirect` SET " . implode(", ", $columns) . " WHERE `redirect_id` = '" . (int)$redirectId . "'");

        return $redirectId;
    }

    /**
     * @param int $redirectId
     * @return boolean
     */
    public function deleteRedirect($redirectId) {
        return $this->db->query("DELETE FROM `" . DB_PREFIX . "srm_redirect` WHERE `redirect_id` = '" . (int)$redirectId . "'");
    }

	/**
	 * @param string $from
	 * @param int    $exceptId
	 * @param int    $storeId
	 *
	 * @return bool
	 */
    public function fromExists($from, $exceptId = 0, $storeId = 0) {
        $results = $this->db->query("SELECT * FROM `" . DB_PREFIX . "srm_redirect` WHERE `from` = '" . $this->db->escape($from) . "' AND `store_id` = '" . (int)$storeId . "' AND `redirect_id` != '" . (int)$exceptId . "'");

        return $results->num_rows > 0;
    }

    /**
     * @param array $data
     * @param bool $total
     * @return string
     */
    protected function getRedirectsSql($data = array(), $total = false) {
        $sql = array();

        $sql[] = "SELECT";
        $sql[] = $total ? " COUNT(*) as `total`" : " *";
        $sql[] = " FROM `" . DB_PREFIX . "srm_redirect`";

        $sql[] = " WHERE 1";

        if ($search = $this->getSearch($data))
            $sql[] = " AND (`from` LIKE '%" . $this->db->escape($search) . "%' OR `to` LIKE '%" . $this->db->escape($search) . "%')";

        if (isset($data['filter_status']) && is_bool($data['filter_status']))
            $sql[] = " AND `status` = '" . (int)$data['filter_status'] . "'";

	    if (isset($data['filter_store']))
	    	$sql[] = " AND `store_id` = '" . (int)$data['filter_store'] . "'";

        if (isset($data['filter_codes']) && $data['filter_codes'])
            $sql[] = " AND `code` IN (" . implode(", ", array_map(function ($code) {
                    return "'" . (int)$code . "'";
                }, $data['filter_codes'])) . ")";

        if ($sort = $this->getSort($data))
            $sql[] = " ORDER BY " . $sort . " " . $this->getOrder($data);

        if (!$total && ($this->hasOffset($data) || $this->hasLimit($data)))
            $sql[] = " LIMIT " . $this->getOffset($data) . ", " . $this->getLimit($data);

        return implode("", $sql);
    }

    /**
     * @param array $data
     * @return string
     */
    protected function getSearch($data = array()) {
        if (isset($data['filter_search']) && $data['filter_search']) {
            return (string)$data['filter_search'];
        }

        return '';
    }

    /**
     * @param array $data
     * @return bool
     */
    protected function hasOffset($data = array()) {
        return isset($data['offset']);
    }

    /**
     * @param array $data
     * @return bool
     */
    protected function hasLimit($data = array()) {
        return isset($data['limit']);
    }

    /**
     * @param array $data
     * @return int
     */
    protected function getOffset($data = array()) {
        if (isset($data['offset']) && (int)$data['offset'] >= 0)
            return (int)$data['offset'];

        return 0;
    }

    /**
     * @param array $data
     * @return int
     */
    protected function getLimit($data = array()) {
        if (isset($data['limit']) && (int)$data['limit'] > 0)
            return (int)$data['limit'];

        return 20;
    }

    /**
     * @param array $data
     * @param array $fields
     * @return string
     */
    protected function getSort($data = array(), $fields = array()) {
        if (isset($data['sort']) && $data['sort'] && (empty($fields) || in_array($data['sort'], $fields)))
            return $this->quoteColumnName($this->db->escape($data['sort']));

        return '';
    }

    protected function getOrder($data = array()) {
        return isset($data['order']) && strtoupper($data['order']) === 'DESC' ? 'DESC' : 'ASC';
    }

    /**
     * Returns quoted column name
     *
     * @param string $column
     * @return string
     */
    protected function quoteColumnName($column) {
        return implode('.', array_map(function ($part) {
            return '`' . $part . '`';
        }, explode('.', $column)));
    }
}