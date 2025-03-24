RESET SLAVE ALL;
RESET MASTER;

INSTALL PLUGIN group_replication SONAME 'group_replication.so';

CHANGE MASTER TO MASTER_USER='rpl', MASTER_PASSWORD='1234' FOR CHANNEL 'group_replication_recovery';

START GROUP_REPLICATION;

SELECT * FROM performance_schema.replication_group_members;

-- 테스트 데이터 복제 확인
SELECT * from replication_test.test_data;
