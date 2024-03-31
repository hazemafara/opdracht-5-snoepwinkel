<?php

class ProductModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getAllProducts()
    {
        $this->db->query("SELECT DISTINCT p.id, p.name, p.barcode FROM product p
                          LEFT JOIN productsupplier ON p.id = productsupplier.productid
                          ORDER BY productsupplier.dateDelivery ASC");

        return $this->db->execute(true);
    }

    public function getProductById(int $productId)
    {
        $this->db->query("SELECT * FROM product WHERE id = :productId");

        $this->db->bind(':productId', $productId);

        return $this->db->execute(true)[0];
    }

    public function getProductAllergyData(int $productId)
    {
        $this->db->query("SELECT * FROM productallergy
                          INNER JOIN allergy ON productallergy.allergyid = allergy.id
                          WHERE productallergy.productid = :productId");

        $this->db->bind(':productId', $productId);


        return $this->db->execute(true);
    }

    public function getProductSupplierData(int $productId)
    {
        $this->db->query("SELECT * FROM supplier
                          INNER JOIN productsupplier ON productsupplier.supplierid = supplier.id
                          WHERE productsupplier.productid = :productId
                          ORDER BY productsupplier.dateDelivery ASC");

        $this->db->bind(':productId', $productId);

        return $this->db->execute(true)[0];
    }

    public function productHasAllergyData(int $productId)
    {
        $this->db->query("SELECT * FROM productallergy WHERE productid = :productId");

        $this->db->bind(':productId', $productId);

        return count($this->db->execute(true)) > 0;
    }
}
