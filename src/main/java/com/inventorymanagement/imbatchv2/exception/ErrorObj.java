package com.inventorymanagement.imbatchv2.exception;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Builder
@Setter
@Getter
public class ErrorObj {
  private int errorCode;
  private String errorId;
  private String errorMessage;
  private List<ErrorObj> additionalErrors;
}
