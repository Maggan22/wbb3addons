<?php
/* $Id$ */
require_once(WCF_DIR.'lib/data/user/User.class.php');
require_once(WCF_DIR.'lib/system/cache/CacheBuilder.class.php');

class CacheBuilderStickyTopicsBox implements CacheBuilder {
	/**
	 * @see CacheBuilder::getData()
	 */
	public function getData($cacheResource) {
		$data           = array();
        $permBoardIDs   = Board::getAccessibleBoards();
		if(!STICKYTOPICSBOX_BOARDIDS || empty($permBoardIDs)) return $data;
		$boardIDs = explode(',', $permBoardIDs);
		$boardIDs = array_intersect($boardIDs, explode(',', STICKYTOPICSBOX_BOARDIDS));
		
		$sql = "SELECT *
		      FROM wbb".WBB_N."_thread
             WHERE isSticky = 1               
               AND boardID IN(".implode(',', $boardIDs).")
               AND isDeleted = 0
               AND isDisabled = 0
               AND movedThreadID = 0";
        if(!STICKYTOPICSBOX_SHOWCLOSED) $sql .= " AND isClosed = 0";
        $sql .= " ORDER BY ".STICKYTOPICSBOX_SORTFIELD." DESC
              LIMIT ".STICKYTOPICSBOX_NUMOFENTRIES;

		$result = WCF::getDB()->sendQuery($sql);
		while ($row = WCF::getDB()->fetchArray($result)) $data[] = $row;
        return $data;
	}
}
?>
