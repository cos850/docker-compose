
1. docker compose up
```shell
docker-compose up -d
```

2. secondary1,2 node - innodb cluster 설정
- mysql shell 접속
```shell
docker exec -it mysql-secondary-1 mysqlsh
```

- mysql shell 내부에서 수행
```js
dba.configureInstance()
\q // 종료
```

- 2번도 동일하게 수행

3. primary node - innodb cluster 설정
- mysql shell 접속
```shell
docker exec -it mysql-primary mysqlsh
```

- mysql shell 내부에서 수행
```js
dba.configureInstance()

var cluster = dba.createCluster("local-cluster")

cluster.addInstance({user: "root", host: "mysql-secondary-1", password: "1234"})

// 복구 메서드 선택 시 'clone' 지정하여 primary 트랜잭션 복제
// Please select a recovery method [C]lone/[A]bort (default Abort): c

cluster.addInstance({user: "root", host: "mysql-secondary-2", password: "1234"})
// secondary-1 노드랑 동일하게 수행
```

4. 자동 시작 설정 주석 해제
- docker-compose.yml
아래 두 설정 주석 해제 후 사용
```
#      - "--loose-group_replication_start_on_boot=ON"
#      - "--loose-group_replication_bootstrap_group=ON"
```

