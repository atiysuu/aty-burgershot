INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('hamburger', 'Bread', 1),
	('water', 'Water', 1),
	('hamburgerbread', 'Hamburger Bread', 1),
	('emptycup', 'Empty Cup', 1),
	('sprite', 'Sprite', 1),
	('cocacola', 'Coca Cola', 1),
	('pepsi', 'Pepsi', 1),
	('frozenmead', 'Frozen Meat', 1),
	('frozenpotato', 'Frozen Potato', 1),
	('spatula', 'Spatula', 1),
	('frozenpotato', 'Frozen Potato', 1),
	('potato', 'Potato', 1),
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('burgershot', 'Burgershot', 1),
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	('burgershot', 0, 'worker', 'Worker', 200, '{}', '{}'),
	('burgershot', 1, 'boss', 'Boss', 200, '{}', '{}'),
;