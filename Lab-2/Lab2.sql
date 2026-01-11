-- 1. Створення користувача 'manager' (пароль 'user1234')
-- Цей користувач зможе тільки продавати
CREATE USER 'manager'@'localhost' IDENTIFIED BY 'user1234';

-- 2. Створення користувача 'admin_user' (пароль 'admin1234')
-- Цей користувач - бос, може все
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin1234';

-- 3. Надаємо права МЕНЕДЖЕРУ
-- Може тільки дивитися (SELECT) товари та покупців
GRANT SELECT ON Products TO 'manager'@'localhost';
GRANT SELECT ON Buyers TO 'manager'@'localhost';

-- Може додавати (INSERT) нові продажі (оформляти угоди) та нових покупців
GRANT INSERT ON Sales TO 'manager'@'localhost';
GRANT INSERT ON Buyers TO 'manager'@'localhost';

-- Може оновлювати (UPDATE) дані покупців (наприклад, змінився телефон)
GRANT UPDATE ON Buyers TO 'manager'@'localhost';

-- 4. Надаємо права АДМІНІСТРАТОРУ
-- Даємо повний доступ (ALL PRIVILEGES) до бази Trade_Var5
GRANT ALL PRIVILEGES ON * TO 'admin_user'@'localhost';

-- 5. Застосовуємо права (обов'язково!)
FLUSH PRIVILEGES;

-- 6. Перевірка прав (це треба для скріншота у звіт)
SHOW GRANTS FOR 'manager'@'localhost';
SHOW GRANTS FOR 'admin_user'@'localhost';