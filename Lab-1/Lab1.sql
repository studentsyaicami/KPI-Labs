
-- 1. СТВОРЕННЯ БАЗИ ДАНИХ ТА ТАБЛИЦЬ
DROP DATABASE IF EXISTS Trade_Var5; -- Очистка, якщо база вже була
CREATE DATABASE Trade_Var5;
USE Trade_Var5;

-- Таблиця 1: Товари (Goods)
CREATE TABLE Goods (
    id_good INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    wholesale_price DECIMAL(10, 2) NOT NULL COMMENT 'Оптова ціна',
    retail_price DECIMAL(10, 2) NOT NULL COMMENT 'Роздрібна ціна',
    description TEXT
);

-- Таблиця 2: Покупці (Buyers)
CREATE TABLE Buyers (
    id_buyer INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    contact_person VARCHAR(100)
);

-- Таблиця 3: Угоди (Sales)
CREATE TABLE Sales (
    id_sale INT AUTO_INCREMENT PRIMARY KEY,
    id_buyer INT NOT NULL,
    id_good INT NOT NULL,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL,
    
    -- 2. ВСТАНОВЛЕННЯ ЗВ'ЯЗКІВ (Foreign Keys)
    CONSTRAINT fk_buyer FOREIGN KEY (id_buyer) REFERENCES Buyers(id_buyer),
    CONSTRAINT fk_good FOREIGN KEY (id_good) REFERENCES Goods(id_good)
);

-- 3. ЗАПОВНЕННЯ ТАБЛИЦЬ ДАНИМИ
INSERT INTO Goods (name, wholesale_price, retail_price, description) VALUES 
('Ноутбук Dell Inspiron', 18000.00, 24000.00, 'Робоча станція'),
('Мишка Logitech G102', 600.00, 900.00, 'Ігрова миша'),
('Монітор Samsung 24"', 4000.00, 5500.00, 'Full HD монітор');

INSERT INTO Buyers (company_name, address, phone, contact_person) VALUES 
('ТОВ "Вектор-Плюс"', 'м. Київ, вул. Хрещатик, 10', '+380441112233', 'Петренко І.І.'),
('ПП "Гаджет-Сервіс"', 'м. Львів, пл. Ринок, 5', '+380325556677', 'Іванов П.П.'),
('ФОП Сидоренко', 'м. Одеса, вул. Дерибасівська, 1', '+380489998877', 'Сидоренко С.С.');

INSERT INTO Sales (id_buyer, id_good, quantity, sale_date) VALUES 
(1, 1, 5, '2023-10-01'),  -- Вектор купив 5 ноутбуків
(2, 2, 10, '2023-10-02'), -- Гаджет купив 10 мишок
(3, 1, 1, '2023-10-03');  -- Сидоренко купив 1 ноутбук

-- 4. РЕДАГУВАННЯ ДАНИХ (UPDATE)
-- Зміна контактної особи
UPDATE Buyers 
SET contact_person = 'Коваленко О.О.' 
WHERE id_buyer = 1;

-- Додавання примітки до телефону
UPDATE Buyers 
SET phone = CONCAT(phone, ' (не дійсний)') 
WHERE id_buyer = 3;

-- 5. РЕДАГУВАННЯ СТРУКТУРИ ТАБЛИЦІ (ALTER)
-- Перейменування таблиці (Goods -> Products)
ALTER TABLE Goods RENAME TO Products;

-- Додавання колонки Email
ALTER TABLE Buyers ADD COLUMN email VARCHAR(100);

-- Переміщення колонки (email після company_name)
ALTER TABLE Buyers MODIFY COLUMN email VARCHAR(100) AFTER company_name;

-- Налаштування поля "Телефон" (UNIQUE) - щоб не було дублів
ALTER TABLE Buyers MODIFY phone VARCHAR(100) NOT NULL;
ALTER TABLE Buyers ADD CONSTRAINT unique_phone UNIQUE (phone);

-- Перестворення зовнішнього ключа (FK)
ALTER TABLE Sales DROP FOREIGN KEY fk_good;
ALTER TABLE Sales ADD CONSTRAINT fk_good_new FOREIGN KEY (id_good) REFERENCES Products(id_good);

-- 6. ПЕРЕВІРКА ЦІЛІСНОСТІ (Спроба помилки)
-- Спроба додати товар без ціни (має викликати помилку, якщо розкоментувати)
-- INSERT INTO Products (name) VALUES ('Товар без ціни');

-- 7. ВИДАЛЕННЯ ДАНИХ ТА ТАБЛИЦЬ (DROP / DELETE)
-- Видалення конкретного запису
DELETE FROM Sales WHERE id_sale = 1;
