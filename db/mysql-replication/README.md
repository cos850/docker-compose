docker exec -it mysql-primary mysqlsh

// shell 내부에서 cluster 만 초기화 (router에서 내부적으로 참조함)
var cluster = dba.createCluster('mycluster');