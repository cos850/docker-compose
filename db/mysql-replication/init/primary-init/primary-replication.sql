INSTALL PLUGIN group_replication SONAME 'group_replication.so';

CREATE USER rpl@'%' IDENTIFIED WITH mysql_native_password BY '1234';
GRANT REPLICATION SLAVE ON *.* TO rpl@'%';
FLUSH PRIVILEGES;

SET GLOBAL group_replication_bootstrap_group=ON;
START GROUP_REPLICATION;
SET GLOBAL group_replication_bootstrap_group=OFF;

SELECT * FROM performance_schema.replication_group_members;

-- 테스트 데이터 생성
CREATE DATABASE IF NOT EXISTS replication_test;
USE replication_test;
CREATE TABLE test_data (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           message VARCHAR(100),
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO test_data (message) VALUES ('Hello Group Replication!');

-- 삭제
DROP TABLE IF EXISTS replication_test.test_data;
DROP DATABASE IF EXISTS replication_test;

