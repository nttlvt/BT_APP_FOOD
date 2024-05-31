CREATE DATABASE restaurant;
USE restaurant;
CREATE TABLE user(
user_id int NOT NULL AUTO_INCREMENT,
full_name varchar(255),
email varchar(255),
password varchar(255),
PRIMARY KEY (user_id)
);

CREATE TABLE food(
food_id int NOT NULL AUTO_INCREMENT,
food_name varchar(255),
image varchar(255),
price float,
des varchar(255),
type_id int NOT NULL,
PRIMARY KEY (food_id),
FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE orders(
user_id int NOT NULL,
food_id int NOT NULL,
amount int,
code varchar(255),
arr_sub_id varchar(255),
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE sub_food(
sub_id int NOT NULL AUTO_INCREMENT,
sub_name varchar(255),
sub_price float,
food_id int NOT NULL,
PRIMARY KEY (sub_id),
FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE rate_res(
user_id int NOT NULL,
res_id int NOT NULL,
amount int,
date_rate datetime,
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE restaurant(
res_id int NOT NULL AUTO_INCREMENT,
res_name varchar(255),
Image varchar(255),
des varchar(255),
PRIMARY KEY (res_id)
);

CREATE TABLE like_res(
user_id int NOT NULL,
res_id int NOT NULL,
date_like datetime,
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);


CREATE TABLE food_type(
type_id int NOT NULL AUTO_INCREMENT,
type_name varchar(255),
PRIMARY KEY (type_id)
);

-- Thêm dữ liệu cho table `user`
INSERT INTO user (full_name, email, password) VALUES
  ('Nguyen van a', 'nguyenvana@gmail.com', 'password'),
  ('Nguyen van b', 'nguyenvanb@gmail.com', 'password'),
  ('Nguyen van c', 'nguyenvanc@gmail.com', 'password'),
  ('Nguyen van d', 'nguyenvand@gmail.com', 'password'),
  ('Nguyen van e', 'nguyenvane@gmail.com', 'password'),
  ('Nguyen van f', 'nguyenvanf@gmail.com', 'password'),
  ('Nguyen van g', 'nguyenvang@gmail.com', 'password'),
  ('Nguyen van h', 'nguyenvanh@gmail.com', 'password');

-- Thêm dữ liệu cho table `restaurant`
INSERT INTO restaurant (res_name, image, des) VALUES
  ('Pho Hai', 'pho_hai.jpg', 'Pho is a Vietnamese noodle soup...'),
  ('Banh Mi 2k', 'banh_mi_2k.jpg', 'Banh mi is a type of Vietnamese...'),
  ('Com Tam Ba Giao', 'com_tam_ba_giao.jpg', 'Com tam is a Vietnamese broken...'),
  ('Bun Cha Obama', 'bun_cha_obama.jpg', 'Bun cha is a popular street food...'),
  ('Cha Ca La Vong', 'cha_ca_la_vong.jpg', 'Cha ca la vong is a traditional...'),
  ('Banh Xeo 100k', 'banh_xeo_100k.jpg', 'Banh xeo is a savoury Vietnamese pancake...'),
  ('Hu Tieu Nam Vang', 'hu_tieu_nam_vang.jpg','Hu Tieu Nam Vang is a savoury Vietnamese pancake...');
-- Thêm dữ liệu cho bảng `food_type`
INSERT INTO food_type (type_name) VALUES
  ('Soup'),
  ('Sandwich'),
  ('Rice'),
  ('Noodle'),
  ('Seafood');

-- Thêm dữ liệu cho bảng `sub_food`
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
  ('Extra Beef', 1.50, 1),
  ('Extra Pickles', 0.50, 2),
  ('Extra Egg', 0.75, 2),
  ('Extra Pork', 1.25, 4),
  ('Extra Shrimp', 2.00, 5),
  ('Extra Bean Sprouts', 0.25, 6);

-- Thêm dữ liệu cho bảng `rate_res`
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
  (1, 1, 5, '2024-05-31 10:00:00'),
  (2, 2, 4, '2024-05-30 15:30:00'),
  (3, 3, 5, '2024-05-29 12:45:00'),
  (4, 4, 3, '2024-05-28 09:00:00'),
  (5, 5, 4, '2024-05-27 14:20:00'),
  (6, 6, 5, '2024-05-26 18:10:00');

-- Thêm dữ liệu cho bảng `like_res`
INSERT INTO like_res (user_id, res_id, date_like) VALUES
  (1, 1, '2024-05-30 11:20:00'),
  (2, 2, '2024-05-29 09:15:00'),
  (3, 3, '2024-05-28 14:30:00'),
  (4, 4, '2024-05-27 16:45:00'),
  (5, 5, '2024-05-26 08:00:00'),
  (6, 6, '2024-05-25 12:10:00');
-- Thêm dữ liệu cho bảng `food` 
INSERT INTO food (food_name, image, price, des, type_id) VALUES
  ('Pho', 'pho.jpg', 5.99, 'Pho is a Vietnamese noodle soup...', 1),
  ('Banh Mi', 'banhmi.jpg', 3.49, 'Banh mi is a type of Vietnamese...', 2),
  ('Com Tam', 'comtam.jpg', 6.99, 'Com tam is a Vietnamese broken...', 3),
  ('Bun Cha', 'buncha.jpg', 7.99, 'Bun cha is a popular street food...', 4),
  ('Cha Ca', 'chaca.jpg', 8.99, 'Cha ca la vong is a traditional...', 5),
  ('Banh Xeo', 'banhxeo.jpg', 6.99, 'Banh xeo is a savoury Vietnamese pancake...', 1);
-- Thêm dữ liệu cho bảng `orders`
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
  (1, 1, 2, 'CODE123', '1,2,3'),
  (2, 2, 1, 'CODE456', '2,3'),
  (3, 3, 3, 'CODE789', '1,3,5'),
  (4, 4, 2, 'CODEABC', NULL),
  (5, 5, 1, 'CODEDEF', '1,4'),
  (6, 6, 3, 'CODEGHI', '2,3,5');
  
 -- Bài Tập --
-- Câu 1: 5 người đã like nhà hàng nhiều nhất
SELECT user.user_id, user.full_name , SUM(rate_res.amount) as luot_like
FROM user 
INNER JOIN rate_res
ON user.user_id = rate_res.user_id
INNER JOIN restaurant
ON rate_res.res_id = restaurant.res_id 
GROUP BY user.user_id
ORDER BY luot_like DESC
LIMIT 5
;

-- Câu 2: 2 nhà hàng có lượt like nhiều nhất
SELECT restaurant.res_id, restaurant.res_name, SUM(rate_res.amount) as total_like
FROM restaurant 
INNER JOIN rate_res
ON restaurant.res_id = rate_res.res_id
INNER JOIN user
ON user.user_id = rate_res.user_id 
GROUP BY restaurant.res_id
ORDER BY total_like DESC
LIMIT 2
;

-- Câu 3: tìm người đã đặt hàng nhiều nhất
select user.full_name as3ame , orders.amount as dat_hang
FROM user
INNER JOIN orders
ON user.user_id = orders.user_id
INNER JOIN food
ON orders.food_id = food.food_id
ORDER BY orders.amount DESC
LIMIT 1
;

-- Câu 4: tìm người dùng không hoạt dộng trong hệ thống
SELECT user.full_name as name
FROM rate_res
RIGHT JOIN orders
ON rate_res.user_id = orders.user_id
RIGHT JOIN user
ON orders.user_id = user.user_id
WHERE rate_res.amount  IS NULL AND orders.amount IS NULL
;

-- Câu 5: tính trung bình sub_food của một food
SELECT sub_food.food_id as id , food.food_name as ten_mon , AVG(sub_food.sub_price) as trung_binh
FROM sub_food
LEFT JOIN food
ON sub_food.food_id = food.food_id
GROUP BY id
;
