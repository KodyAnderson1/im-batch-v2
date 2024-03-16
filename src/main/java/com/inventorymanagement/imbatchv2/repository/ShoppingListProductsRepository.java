package com.inventorymanagement.imbatchv2.repository;

import com.inventorymanagement.imbatchv2.model.entity.ShoppingListProducts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShoppingListProductsRepository extends JpaRepository<ShoppingListProducts, Long> {
}
