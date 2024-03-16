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
@Table(name = "QuantityScheduler")
public class QuantityScheduler {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "user_id")
    private String userId;

    @Column(name = "product_id")
    private int productId;

    @Column(name = "action")
    private String action;

    @Column(name = "quantity_to_change")
    private double quantityToChange;

    @Column(name = "frequency")
    private String frequency;

    @Column(name = "update_on")
    private int updateOn;

    @Column(name = "start_date")
    private String startDate;

    @Column(name = "end_date")
    private String endDate;

    @Column(name = "next_run")
    private String nextRun;

    @Column(name = "last_run")
    private String lastRun;

    @Column(name = "is_active")
    private boolean isActive;

    @Column(name = "is_admin_disabled")
    private boolean isAdminDisabled;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private String createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private String updatedAt;
}