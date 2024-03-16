package com.inventorymanagement.imbatchv2.utils;

import lombok.Getter;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
public enum Days {
  SUNDAY(64),
  MONDAY(32),
  TUESDAY(16),
  WEDNESDAY(8),
  THURSDAY(4),
  FRIDAY(2),
  SATURDAY(1);

  private final int bitmask;

  Days(int bitmask) {
    this.bitmask = bitmask;
  }

  public static int getBitmask(List<Days> days) {
    int bitmask = 0;
    for (Days day : days) {
      bitmask |= day.getBitmask();
    }
    return bitmask;
  }

  public LocalDate getNextRun() {
    LocalDate today = LocalDate.now();
    int day = today.getDayOfWeek().getValue();
    int daysToAdd = 0;
    for (int i = 0; i < 7; i++) {
      if ((bitmask & (1 << ((day + i) % 7))) != 0) {
        daysToAdd = i;
        break;
      }
    }
    return today.plusDays(daysToAdd);
  }

  public static LocalDate getNextRun(List<Days> days) {
    LocalDate today = LocalDate.now();
    int dayOfWeek = today.getDayOfWeek().getValue();
    int day = dayOfWeek % 7;
    for (int i = 1; i <= 7; i++) {
      Days nextDay = Days.values()[(day + i) % 7];
      if (days.contains(nextDay)) {
        return today.plusDays(i);
      }
    }
    return today.plusDays(1);
  }


  public static List<Days> getDaysFromBitmask(Integer bitmask) {
    List<Days> days = new ArrayList<>();
    if (bitmask == null) return days;

    for (Days day : Days.values()) {
      if ((bitmask & day.getBitmask()) != 0) {
        days.add(day);
      }
    }
    return days;
  }

  public static Days getToday() {
    int day = LocalDate.now().getDayOfWeek().getValue();
    return Days.values()[day];
  }


  public static int getBitmaskFromStrings(List<String> days) {
    int bitmask = 0;
    for (String day : days) {
      bitmask |= Days.valueOf(day.toUpperCase()).getBitmask();
    }
    return bitmask;
  }

  public static List<String> getStringsFromBitmask(Integer bitmask) {
    List<String> days = new ArrayList<>();
    if (bitmask == null) return days;

    for (Days day : Days.values()) {
      if ((bitmask & day.getBitmask()) != 0) {
        days.add(day.name());
      }
    }
    return days;
  }
}