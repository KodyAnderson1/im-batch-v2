package com.inventorymanagement.imbatchv2.model.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import org.hibernate.annotations.CreationTimestamp;

@Entity
@Getter
@Table(name = "SchedulerAudit")
public class SchedulerAudit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "user_id")
    private String userId;

    @Column(name = "product_id")
    private int productId;

    @Column(name = "scheduler_id")
    private int schedulerId;

    @Column(name = "action")
    private String action;

    @Column(name = "new_quantity")
    private double newQuantity;

    @Column(name = "old_quantity")
    private double oldQuantity;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private String createdAt;

}