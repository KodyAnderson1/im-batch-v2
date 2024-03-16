package com.inventorymanagement.imbatchv2.controller;

import com.inventorymanagement.imbatchv2.exception.ErrorObj;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
@RequiredArgsConstructor
public class AdviceController {

  @ExceptionHandler(RuntimeException.class)
  private ResponseEntity<ErrorObj> runtimeExteptionHandler(RuntimeException ex) {
    var errorObj = ErrorObj.builder()
            .errorCode(HttpStatus.INTERNAL_SERVER_ERROR.value())
            .errorId(HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase())
            .errorMessage(ex.getMessage())
            .build();

    logException(ex, "RuntimeException");
    return new ResponseEntity<>(errorObj, HttpStatus.INTERNAL_SERVER_ERROR);
  }

  @ExceptionHandler(Exception.class)
  private ResponseEntity<ErrorObj> exceptionHandler(Exception ex) {
    var errorObj = ErrorObj.builder()
            .errorCode(HttpStatus.INTERNAL_SERVER_ERROR.value())
            .errorId(HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase())
            .errorMessage(ex.getMessage())
            .build();

    logException(ex, "Exception");
    return new ResponseEntity<>(errorObj, HttpStatus.INTERNAL_SERVER_ERROR);
  }

  private void logException(Exception ex, String exceptionType) {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(exceptionType).append(" occured");

    if (ex.getStackTrace().length > 0) {
      StackTraceElement ele = ex.getStackTrace()[0];
      stringBuilder.append("\nClass Name: ").append(ele.getClassName());
      stringBuilder.append("\nMethod Name: ").append(ele.getMethodName());
      stringBuilder.append("\nFile Name: ").append(ele.getFileName());
      stringBuilder.append("\nLine Number: ").append(ele.getLineNumber());

      log.error(stringBuilder.toString());
    }
  }
}
