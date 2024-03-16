package com.inventorymanagement.imbatchv2.controller;

import com.inventorymanagement.imbatchv2.service.BatchService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class Controller {

  private final BatchService batchService;


  @GetMapping
  @ResponseStatus(HttpStatus.NO_CONTENT)
  public void get() {
    batchService.entryPoint();
  }
}
