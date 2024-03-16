package com.inventorymanagement.imbatchv2.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Getter
@Table(name = "ProductTasks")
public class ProductTasks {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(name = "task")
  private String task;

  @Column(name = "add_to_list")
  private int addToList;

  @CreationTimestamp
  @Column(name = "created_at", nullable = false, updatable = false)
  private String createdAt;

  @UpdateTimestamp
  @Column(name = "updated_at")
  private String updatedAt;

  @Column(name = "user_id")
  private String userId;

  @Column(name = "product_id")
  private int productId;

  @Column(name = "quantity_threshold")
  private double quantityThreshold;

}
