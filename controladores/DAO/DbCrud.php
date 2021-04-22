<?php

require_once "DAO/DbPdo.php";

class DbCrud {

    //Conexion db PDO``
    protected function _getDbh() {
        return DbPdo::getInstance()->getConn();
    }

    public function save($tabla, $datos, $where = null, $id = null) {

        $result = null;
        $iterator = new ArrayIterator($datos);
        if ($where == null) {

            $sql = "INSERT INTO `$tabla` (";

            while ($iterator->valid()) {
                $sql .= "`" . $iterator->key() . "`,";
                $iterator->next();
            }
            $sql = substr($sql, 0, -1);
            $sql .= ") VALUES (";


            foreach ($iterator as $param) {

                $sql .= "'" . $param . "',";
            }

            $sql = substr($sql, 0, -1);
            $sql .= ")";
           //echo $sql;
        } else {

            $sql = "UPDATE  `$tabla` SET ";

            while ($iterator->valid()) {
                $sql .= "`" . $iterator->key() . "` = '" . $iterator->current() . "',";
                $iterator->next();
            }

            $sql = substr($sql, 0, -1); // ELIMINA LA ULTIMA COMA  
            $sql .= " WHERE `$where` = $id";
            echo $sql;
        }

        $result = $this->_getDbh()->exec($sql); // EJECUTA SQL

        if ($id == null) {

            return $result = $this->_getDbh()->lastInsertId();
        } else {

            return $result;
        }
    }

    public function delete($tabla, $where, $id) {

        $result = null;
        $sql = "DELETE FROM `$tabla` WHERE `$where` = ?";
        $stm = $this->_getDbh()->prepare($sql);
        $stm->bindParam(1, $id, PDO::PARAM_INT);
        $result = $stm->execute();

        return $result;
    }

    public function select($tabla, $datos = null, $nombre = null) {

        $found = new ArrayObject();
        $result = null;
        if ($datos == null && $nombre == null) {
            $sql = "SELECT  * FROM `$tabla` ";
        } else {
            $sql = "SELECT ";
            foreach ($datos as $value) {

                $sql .= "`$value`,";
            }

            $sql = substr($sql, 0, -1);
            
            
            $sql .= "FROM `$tabla`";
            if ($nombre != null) {

                $sql .= " WHERE nombre = $nombre";
            }

//            echo $sql;
        }
        $stm = $this->_getDbh()->query($sql);
        while ($rows = $stm->fetch(PDO::FETCH_BOTH)) {

            $found->append($rows);
        }

        return $found;
    }

}

?>