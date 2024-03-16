package com.inventorymanagement.imbatchv2.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "Product")
public class Product {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(name = "name")
  private String name;

  @Column(name = "default_quantity")
  private double defaultQuantity;

  @Column(name = "category_id")
  private long categoryId;

  @Column(name = "description")
  private String description;

  @Column(name = "brand")
  private String brand;

  @Column(name = "store_link")
  private String storeLink;

  @Column(name = "current_quantity")
  private double currentQuantity;

  @Column(name = "unit_of_measurement")
  private String unitOfMeasurement;

  @Column(name = "expiration_date")
  private String expirationDate;

  @Column(name = "location")
  private String location;

  @Column(name = "gtin")
  private String gtin;

  @Column(name = "image")
  private String image;

  @Column(name = "search_category")
  private String searchCategory;

  @Column(name = "purchase_date")
  private String purchaseDate;

  @Column(name = "user_id")
  private String userId;

  @CreationTimestamp
  @Column(name = "created_at", nullable = false, updatable = false)
  private String createdAt;

  @UpdateTimestamp
  @Column(name = "updated_at")
  private String updatedAt;
}