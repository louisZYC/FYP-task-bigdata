CREATE TABLE `SearchHistory` (
  `search_id` char(32) PRIMARY KEY,
  `content` varchar(255) character set utf8mb4 NOT NULL
);

CREATE TABLE `SearchRef` (
  `search_id` char(32) ,
  `service_id` char(32) ,
  `priority` int,
  PRIMARY KEY (`search_id`, `service_id`)
);

CREATE TABLE `Keyword` (
  `kw_id` char(32),
  `name` varchar(255) character set utf8mb4 NOT NULL,
  PRIMARY KEY (`kw_id`, `name`)
);

CREATE TABLE `KeywordRef` (
  `kw_id` char(32),
  `service_id` char(32),
  `score` Int(11),
  PRIMARY KEY (`kw_id`, `service_id`)
);

ALTER TABLE `SearchRef` ADD FOREIGN KEY (`search_id`) REFERENCES `SearchHistory` (`search_id`);

ALTER TABLE `KeywordRef` ADD FOREIGN KEY (`kw_id`) REFERENCES `Keyword` (`kw_id`);

INSERT INTO `SearchHistory` VALUES 
('1','Red'),
('2','node module'),
('3','js framework'),
('4','js framework'),
('5','node module'),
('6','language');


INSERT INTO `SearchRef` VALUES 
('1','Apple',1),
('1','Apple Pie1',2),
('1','Apple Pie2',3),
('1','Apple Pie3',4),
('2','fs',1),
('2','http',2),
('2','path',3),
('2','util',4),
('3','Vue',1),
('3','React',2),
('3','Angular',3),
('4','Vue',1),
('4','Ract',2),
('4','Angular',3),
('4','Express',4),
('5','fs',1),
('5','http',2),
('5','crypto',3),
('5','os',4),
('6','php',1),
('6','java',2),
('6','python',3);

