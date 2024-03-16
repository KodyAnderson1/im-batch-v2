package com.inventorymanagement.imbatchv2.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

import java.util.UUID;

@Entity
@Table(name = "categories")
public class Category {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "name")
  private String name;

  @Column(name = "description")
  private String description;

  @Column(name = "icon")
  private String icon;

  @Column(name = "icon_color")
  private String iconColor;

  @Column(name = "user_id")
  private String userId;

  @GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
  @Column(name = "category_guid", updatable = false, nullable = false)
  private UUID categoryGuid;

  @CreationTimestamp
  @Column(name = "created_at", nullable = false, updatable = false)
  private String createdAt;

  @UpdateTimestamp
  @Column(name = "updated_at")
  private String updatedAt;

}
