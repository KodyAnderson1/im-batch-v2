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
@Table(name = "notifications")
public class Notification {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @Column(name = "notification_status")
  private String notificationStatus;

  @Column(name = "notification_message")
  private String notificationMessage;

  @Column(name = "notification_type")
  private String notificationType;

  @CreationTimestamp
  @Column(name = "created_at", nullable = false, updatable = false)
  private String createdAt;

  @Column(name = "acknowledged_at")
  private String acknowledgedAt;

  @Column(name = "product_id")
  private Integer productId;

  @Column(name = "user_id")
  private String userId;


}
