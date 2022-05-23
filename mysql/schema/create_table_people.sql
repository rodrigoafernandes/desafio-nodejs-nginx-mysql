CREATE TABLE `people` (
	`id`            INT(11) NOT NULL auto_increment ,
	`name`          VARCHAR(255) NOT NULL,
  	PRIMARY KEY (`id`)
)
engine = innodb charset=utf8mb4 COLLATE utf8mb4_general_ci;