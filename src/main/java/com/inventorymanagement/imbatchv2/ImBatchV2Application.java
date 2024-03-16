package com.inventorymanagement.imbatchv2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy
public class ImBatchV2Application {

  public static void main(String[] args) {
    SpringApplication.run(ImBatchV2Application.class, args);
  }

}
