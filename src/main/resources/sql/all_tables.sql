CREATE TABLE `api_products`
(
    `id`                  varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `name`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `gtin`                varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL,
    `default_quantity`    int                                                           NOT NULL DEFAULT '0',
    `unit_of_measurement` enum ('COUNT','FLUID_OUNCE','POUND','OUNCE','GRAM','KILOGRAM','LITER','MILLILITER','PIECE','PACKAGE','BOTTLE','CAN','BAG','BOX','BUNDLE','ROLL','OTHER') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'OTHER',
    `origin`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `description`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `image`               varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `brand`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `store_link`          varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `code_type`           varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `barcode_url`         varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `category`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `upc`                 varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci           DEFAULT NULL,
    `ean`                 varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci           DEFAULT NULL,
    `category_path`       varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `size`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci          DEFAULT NULL,
    `created_at`          timestamp(6)                                                  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`          timestamp(6)                                                  NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `specs`               json                                                                   DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY                   `idx_api_products_name` (`name`),
    KEY                   `idx_api_products_product_gtin` (`gtin`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `categories`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT,
    `category_guid` binary(16) NOT NULL,
    `created_at`    varchar(255) NOT NULL,
    `description`   varchar(255) DEFAULT NULL,
    `icon`          varchar(255) DEFAULT NULL,
    `icon_color`    varchar(255) DEFAULT NULL,
    `name`          varchar(255) DEFAULT NULL,
    `updated_at`    varchar(255) DEFAULT NULL,
    `user_id`       varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `notifications`
(
    `product_id`           int          DEFAULT NULL,
    `id`                   bigint       NOT NULL AUTO_INCREMENT,
    `acknowledged_at`      varchar(255) DEFAULT NULL,
    `created_at`           varchar(255) NOT NULL,
    `notification_message` varchar(255) DEFAULT NULL,
    `notification_status`  varchar(255) DEFAULT NULL,
    `notification_type`    varchar(255) DEFAULT NULL,
    `user_id`              varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `product`
(
    `current_quantity` double DEFAULT NULL,
    `default_quantity` double DEFAULT NULL,
    `category_id`         bigint       DEFAULT NULL,
    `id`                  bigint       NOT NULL AUTO_INCREMENT,
    `brand`               varchar(255) DEFAULT NULL,
    `created_at`          varchar(255) NOT NULL,
    `description`         varchar(255) DEFAULT NULL,
    `expiration_date`     varchar(255) DEFAULT NULL,
    `gtin`                varchar(255) DEFAULT NULL,
    `image`               varchar(255) DEFAULT NULL,
    `location`            varchar(255) DEFAULT NULL,
    `name`                varchar(255) DEFAULT NULL,
    `purchase_date`       varchar(255) DEFAULT NULL,
    `search_category`     varchar(255) DEFAULT NULL,
    `store_link`          varchar(255) DEFAULT NULL,
    `unit_of_measurement` varchar(255) DEFAULT NULL,
    `updated_at`          varchar(255) DEFAULT NULL,
    `user_id`             varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `product_quantity_changes`
(
    `new_quantity` double DEFAULT NULL,
    `old_quantity` double DEFAULT NULL,
    `product_id` int          DEFAULT NULL,
    `id`         bigint       NOT NULL AUTO_INCREMENT,
    `cause`      varchar(255) DEFAULT NULL,
    `created_at` varchar(255) NOT NULL,
    `user_id`    varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `product_tasks`
(
    `add_to_list` int          DEFAULT NULL,
    `product_id`  int          DEFAULT NULL,
    `quantity_threshold` double DEFAULT NULL,
    `id`          bigint       NOT NULL AUTO_INCREMENT,
    `created_at`  varchar(255) NOT NULL,
    `task`        varchar(255) DEFAULT NULL,
    `updated_at`  varchar(255) DEFAULT NULL,
    `user_id`     varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `quantity_scheduler`
(
    `id`                int          NOT NULL AUTO_INCREMENT,
    `is_active`         bit(1)       DEFAULT NULL,
    `is_admin_disabled` bit(1)       DEFAULT NULL,
    `product_id`        int          DEFAULT NULL,
    `quantity_to_change` double DEFAULT NULL,
    `update_on`         int          DEFAULT NULL,
    `action`            varchar(255) DEFAULT NULL,
    `created_at`        varchar(255) NOT NULL,
    `end_date`          varchar(255) DEFAULT NULL,
    `frequency`         varchar(255) DEFAULT NULL,
    `last_run`          varchar(255) DEFAULT NULL,
    `next_run`          varchar(255) DEFAULT NULL,
    `start_date`        varchar(255) DEFAULT NULL,
    `updated_at`        varchar(255) DEFAULT NULL,
    `user_id`           varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `scheduler_audit`
(
    `new_quantity` double DEFAULT NULL,
    `old_quantity` double DEFAULT NULL,
    `product_id`   int          DEFAULT NULL,
    `scheduler_id` int          DEFAULT NULL,
    `id`           bigint       NOT NULL AUTO_INCREMENT,
    `action`       varchar(255) DEFAULT NULL,
    `created_at`   varchar(255) NOT NULL,
    `user_id`      varchar(255) DEFAULT NULL,
    `run_id`       varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `search_history`
(
    `id`             int                                                           NOT NULL AUTO_INCREMENT,
    `user_id`        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `search_term`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `search_filters` json DEFAULT NULL,
    `results`        json DEFAULT NULL,
    `created_at`     datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP (3),
    PRIMARY KEY (`id`),
    KEY              `userId_idx` (`user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 92
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

CREATE TABLE `shopping_list_products`
(
    `is_checked` bit(1)       DEFAULT NULL,
    `product_id` int          DEFAULT NULL,
    `quantity`   int          DEFAULT NULL,
    `id`         bigint       NOT NULL AUTO_INCREMENT,
    `created_at` varchar(255) NOT NULL,
    `note`       varchar(255) DEFAULT NULL,
    `reason`     varchar(255) DEFAULT NULL,
    `updated_at` varchar(255) DEFAULT NULL,
    `user_id`    varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;






