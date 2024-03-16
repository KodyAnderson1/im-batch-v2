package com.inventorymanagement.imbatchv2.repository;

import com.inventorymanagement.imbatchv2.model.entity.SchedulerAudit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SchedulerAuditRepository extends JpaRepository<SchedulerAudit, Long> {
}
