CREATE TABLE `SearchHistory` (
  `search_id` char(32) PRIMARY KEY,
  `content` varchar(255) character set utf8mb4 NOT NULL
);

CREATE TABLE `SearchRef` (
  `search_id` char(32) PRIMARY KEY,
  `service_id` char(32) PRIMARY KEY,
  `priority` int
);

CREATE TABLE `Keyword` (
  `kw_id` char(32),
  `name` varchar(255) character set utf8mb4 NOT NULL,
  PRIMARY KEY (`kw_id`, `name`)
);

CREATE TABLE `KeywordRef` (
  `kw_id` char(32),
  `service_id` char(32),
  `score` int,
  PRIMARY KEY (`kw_id`, `service_id`)
);

ALTER TABLE `SearchRef` ADD FOREIGN KEY (`search_id`) REFERENCES `SearchHistory` (`search_id`);

ALTER TABLE `KeywordRef` ADD FOREIGN KEY (`kw_id`) REFERENCES `Keyword` (`kw_id`);

INSERT INTO `SearchHistory` VALUES 
('1','Red Circle'),
('2','lol')

INSERT INTO `SearchRef` VALUES 
('1','Apple',1),
('1','Apple Pie1',2),
('1','Apple Pie2',3),
('1','Apple Pie3',4),
('2','Zed',1),
('2','Lee',2),
('2','Sin',3),
('2','Diamond',4)
