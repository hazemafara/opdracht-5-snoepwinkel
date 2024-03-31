<?php

class StorageModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getAllStorageData()
    {
        $this->db->query("SELECT * FROM storage");

        return $this->db->execute(true);
    }

    public function getProductStorageData(int $productId)
    {
        $this->db->query("SELECT * FROM storage WHERE productid = :productId");

        $this->db->bind(':productId', $productId);

        return  $this->db->execute(true)[0];
    }
}
