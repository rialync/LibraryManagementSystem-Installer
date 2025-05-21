ALTER USER 'root'@'localhost' IDENTIFIED BY '';
CREATE DATABASE IF NOT EXISTS library_management;
GRANT ALL PRIVILEGES ON library_management.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
