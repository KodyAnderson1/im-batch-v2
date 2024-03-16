package com.inventorymanagement.imbatchv2.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "ProductQuantityChanges")
public class ProductQuantityChanges {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(name = "old_quantity")
  private double oldQuantity;

  @Column(name = "new_quantity")
  private double newQuantity;

  @Column(name = "cause")
  private String cause;

  @CreationTimestamp
  @Column(name = "created_at", nullable = false, updatable = false)
  private String createdAt;

  @Column(name = "user_id")
  private String userId;

  @Column(name = "product_id")
  private int productId;

}
