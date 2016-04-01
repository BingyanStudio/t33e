# update or insert
CREATE TABLE `table_name` (
    `id` PRIMARY KEY NOT NULL,
    `name` VARCHAR NOT NULL DEFAULT "",
    `num` INT NOT NULL DEFAULT 0
);

# on sqlite
INSERT OR REPLACE `table_name` (`id`, `name`, `num`) VALUES (1, "2333", 2);

# on mysql
INSERT INTO `table_name` VALUES (1, "2333", 2) ON DUPLICATE KEY UPDATE `name`="2333", `num`=2;

# on postgresql >= 9.5
# postgresql doesnt support `
# and varchar should be in single quotes
INSERT INTO table_name VALUES (1, '2333', 2) ON CONFLICT(id) DO UPDATE SET name='2333', num=2;

