CREATE TABLE `categories` (
    `id`            int          NOT NULL AUTO_INCREMENT,
    `name`          varchar(255) NOT NULL,
    `icon`          enum('CUP_SODA','COFFEE','THERMOMETER_SNOWFLAKE','APPLE','BANANA','BEEF','CANDY','CARROT','COOKIE','CROISSANT','UTENSILS','FISH','BEER','CAKE','CITRUS','EGG','VEGAN','HOME','BLINDS','LAMP','WAREHOUSE','TOWER_CONTROL','FIRE_EXTINGUISHER','HAND','KEYBOARD','HAMMER','HEATER','MICROWAVE','REFRIGERATOR','WASHING_MACHINE','WRENCH','BOOK_A','TV','NOTEPAD','SPRAY_CAN','POPCORN','LOLLIPOP','PIZZA','WHEAT','GLASS_WATER','HOP','DESSERT','ICE_CREAM','NUT','SALAD','SANDWICH','SOUP','MILK','WINE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UTENSILS',
    `icon_color`    enum('RED','ORANGE','YELLOW','EMERALD','GREEN','TEAL','BLUE','SKY','VIOLET','PURPLE','PINK','STONE','GREY','BLACK','WHITE','ROSE') NOT NULL DEFAULT 'EMERALD',
    `user_id`       varchar(255) NOT NULL,
    `description`   varchar(255)          DEFAULT NULL,
    `created_at`    timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`    timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `category_guid` varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `category_guid` (`category_guid`),
    KEY             `idx_categories_user_id` (`user_id`)
);

CREATE TABLE `Notifications` (
    `id`                   int          NOT NULL AUTO_INCREMENT,
    `notification_status`  enum('UNREAD','READ','DISMISSED') NOT NULL DEFAULT 'UNREAD',
    `notification_message` varchar(255) NOT NULL,
    `notification_type`    enum('LOW_STOCK','EXPIRATION','TASK','SHOPPING_LIST','ERROR','OTHER','OUT_OF_STOCK') NOT NULL,
    `created_at`           timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `acknowledged_at`      timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP (6),
    `product_id`           int          NOT NULL,
    `user_id`              varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    KEY                    `idx_notifications_product_id` (`product_id`),
    KEY                    `idx_notifications_user_id` (`user_id`)
);

CREATE TABLE `Product` (
    `id`                     int          NOT NULL AUTO_INCREMENT,
    `name`                   varchar(255) NOT NULL,
    `default_quantity` double NOT NULL DEFAULT '1',
    `category_id`            int          NOT NULL,
    `description`            varchar(255)          DEFAULT NULL,
    `brand`                  varchar(255)          DEFAULT NULL,
    `store_link`             varchar(191)          DEFAULT NULL,
    `current_quantity` double DEFAULT '0',
    `unit_of_measurement`    enum('COUNT','FLUID_OUNCE','POUND','OUNCE','GRAM','KILOGRAM','LITER','MILLILITER','PIECE','PACKAGE','BOTTLE','CAN','BAG','BOX','BUNDLE','ROLL','OTHER') DEFAULT 'OTHER',
    `expiration_date`        date                  DEFAULT NULL,
    `location`               varchar(255)          DEFAULT NULL,
    `gtin`                   varchar(30)           DEFAULT NULL,
    `image`                  varchar(191)          DEFAULT NULL,
    `search_category`        enum('FOOD','BEVERAGE','ALCOHOL','HOUSEHOLD','LAUNDRY','CLEANING','PERSONAL_CARE','BABY','PET','OTHER') DEFAULT 'FOOD',
    `purchase_date`          date                  DEFAULT NULL,
    `user_id`                varchar(255) NOT NULL,
    `created_at`             timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`             timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (`id`),
    KEY                      `idx_products_user_id` (`user_id`),
    KEY                      `idx_products_category_id` (`category_id`)
);

CREATE TABLE `ProductQuantityChanges` (
    `id`         int          NOT NULL AUTO_INCREMENT,
    `old_quantity` double NOT NULL DEFAULT '0',
    `new_quantity` double NOT NULL DEFAULT '0',
    `cause`      enum('MANUAL','RESTOCK','TASK','SHOPPING_LIST','EXPIRATION','OTHER') NOT NULL DEFAULT 'MANUAL',
    `createdAt`  timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `user_id`    varchar(255) NOT NULL,
    `product_id` int          NOT NULL,
    PRIMARY KEY (`id`),
    KEY          `idx_product_quantity_changes_product_id` (`product_id`),
    KEY          `idx_product_quantity_changes_user_id` (`user_id`)
);

CREATE TABLE `ProductTasks` (
    `id`          int          NOT NULL AUTO_INCREMENT,
    `task`        enum('EXPIRATION','LOW_STOCK','CUSTOM') NOT NULL DEFAULT 'LOW_STOCK',
    `add_to_list` tinyint(1) NOT NULL DEFAULT '0',
    `created_at`  timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at`  timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `user_id`     varchar(255) NOT NULL,
    `product_id`  int          NOT NULL,
    `quantity_threshold` double DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY           `idx_product_tasks_user_id` (`user_id`),
    KEY           `idx_product_tasks_product_id` (`product_id`)
);

CREATE TABLE `QuantityScheduler` (
    `id`                int          NOT NULL AUTO_INCREMENT,
    `user_id`           varchar(191) NOT NULL,
    `product_id`        int          NOT NULL,
    `action`            enum('SET','INCREMENT','DECREMENT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DECREMENT',
    `quantity_to_change` double NOT NULL DEFAULT '1',
    `frequency`         enum('Daily','Weekly','BiWeekly','Monthly','BiMonthly','Quarterly','SemiAnnually','Annually') NOT NULL DEFAULT 'Daily',
    `update_on`         tinyint unsigned NOT NULL DEFAULT '0',
    `start_date`        date         NOT NULL,
    `end_date`          date DEFAULT NULL,
    `next_run`          date DEFAULT NULL,
    `last_run`          date DEFAULT NULL,
    `is_active`         tinyint(1) NOT NULL DEFAULT '1',
    `is_admin_disabled` tinyint(1) NOT NULL DEFAULT '0',
    `created_at`        datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP (3),
    `updated_at`        datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP (3) ON UPDATE CURRENT_TIMESTAMP (3),
    PRIMARY KEY (`id`),
    KEY                 `idx_quantity_scheduler_user_id` (`user_id`),
    KEY                 `idx_quantity_scheduler_product_id` (`product_id`),
    KEY                 `idx_qs_optimized` (`is_active`,`is_admin_disabled`,`product_id`,`end_date`,`action`)
);

CREATE TABLE `SchedulerAudit`
(
    `id`           int          NOT NULL AUTO_INCREMENT,
    `user_id`      varchar(191) NOT NULL,
    `product_id`   int          NOT NULL,
    `scheduler_id` int          NOT NULL,
    `action`       enum('SET','INCREMENT','DECREMENT') NOT NULL,
    `new_quantity` double NOT NULL DEFAULT '0',
    `old_quantity` double NOT NULL DEFAULT '0',
    `created_at`   datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP (3),
    PRIMARY KEY (`id`)
);

CREATE TABLE `ShoppingListProducts` (
    `id`         int          NOT NULL AUTO_INCREMENT,
    `quantity`   int          NOT NULL DEFAULT '1',
    `product_id` int          NOT NULL,
    `reason`     enum('LOW_STOCK','EXPIRATION','MANUAL','OTHER','OUT_OF_STOCK') NOT NULL DEFAULT 'MANUAL',
    `user_id`    varchar(255) NOT NULL,
    `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `note`       varchar(255)          DEFAULT NULL,
    `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP (6),
    `is_checked` tinyint(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY          `idx_shopping_list_products_user_id` (`user_id`),
    KEY          `idx_shopping_list_products_product_id` (`product_id`)
);

